// Copyright 2020 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/tint/sem/struct.h"
#include "src/tint/sem/test_helper.h"
#include "src/tint/type/texture.h"

namespace tint::sem {
namespace {

using namespace tint::number_suffixes;  // NOLINT
using StructTest = TestHelper;

TEST_F(StructTest, Creation) {
    auto name = Sym("S");
    auto* impl = create<ast::Struct>(name, utils::Empty, utils::Empty);
    auto* ptr = impl;
    auto* s = create<sem::Struct>(impl, impl->source, impl->name, utils::Empty, 4u /* align */,
                                  8u /* size */, 16u /* size_no_padding */);
    EXPECT_EQ(s->Declaration(), ptr);
    EXPECT_EQ(s->Align(), 4u);
    EXPECT_EQ(s->Size(), 8u);
    EXPECT_EQ(s->SizeNoPadding(), 16u);
}

TEST_F(StructTest, Hash) {
    auto* a_impl = create<ast::Struct>(Sym("a"), utils::Empty, utils::Empty);
    auto* a = create<sem::Struct>(a_impl, a_impl->source, a_impl->name, utils::Empty,
                                  4u /* align */, 4u /* size */, 4u /* size_no_padding */);
    auto* b_impl = create<ast::Struct>(Sym("b"), utils::Empty, utils::Empty);
    auto* b = create<sem::Struct>(b_impl, b_impl->source, b_impl->name, utils::Empty,
                                  4u /* align */, 4u /* size */, 4u /* size_no_padding */);

    EXPECT_NE(a->Hash(), b->Hash());
}

TEST_F(StructTest, Equals) {
    auto* a_impl = create<ast::Struct>(Sym("a"), utils::Empty, utils::Empty);
    auto* a = create<sem::Struct>(a_impl, a_impl->source, a_impl->name, utils::Empty,
                                  4u /* align */, 4u /* size */, 4u /* size_no_padding */);
    auto* b_impl = create<ast::Struct>(Sym("b"), utils::Empty, utils::Empty);
    auto* b = create<sem::Struct>(b_impl, b_impl->source, b_impl->name, utils::Empty,
                                  4u /* align */, 4u /* size */, 4u /* size_no_padding */);

    EXPECT_TRUE(a->Equals(*a));
    EXPECT_FALSE(a->Equals(*b));
    EXPECT_FALSE(a->Equals(Void{}));
}

TEST_F(StructTest, FriendlyName) {
    auto name = Sym("my_struct");
    auto* impl = create<ast::Struct>(name, utils::Empty, utils::Empty);
    auto* s = create<sem::Struct>(impl, impl->source, impl->name, utils::Empty, 4u /* align */,
                                  4u /* size */, 4u /* size_no_padding */);
    EXPECT_EQ(s->FriendlyName(Symbols()), "my_struct");
}

TEST_F(StructTest, Layout) {
    auto* inner_st =  //
        Structure("Inner", utils::Vector{
                               Member("a", ty.i32()),
                               Member("b", ty.u32()),
                               Member("c", ty.f32()),
                               Member("d", ty.vec3<f32>()),
                               Member("e", ty.mat4x2<f32>()),
                           });

    auto* outer_st = Structure("Outer", utils::Vector{
                                            Member("inner", ty.type_name("Inner")),
                                            Member("a", ty.i32()),
                                        });

    auto p = Build();
    ASSERT_TRUE(p.IsValid()) << p.Diagnostics().str();

    auto* sem_inner_st = p.Sem().Get(inner_st);
    auto* sem_outer_st = p.Sem().Get(outer_st);

    EXPECT_EQ(sem_inner_st->Layout(p.Symbols()),
              R"(/*            align(16) size(64) */ struct Inner {
/* offset( 0) align( 4) size( 4) */   a : i32;
/* offset( 4) align( 4) size( 4) */   b : u32;
/* offset( 8) align( 4) size( 4) */   c : f32;
/* offset(12) align( 1) size( 4) */   // -- implicit field alignment padding --;
/* offset(16) align(16) size(12) */   d : vec3<f32>;
/* offset(28) align( 1) size( 4) */   // -- implicit field alignment padding --;
/* offset(32) align( 8) size(32) */   e : mat4x2<f32>;
/*                               */ };)");

    EXPECT_EQ(sem_outer_st->Layout(p.Symbols()),
              R"(/*            align(16) size(80) */ struct Outer {
/* offset( 0) align(16) size(64) */   inner : Inner;
/* offset(64) align( 4) size( 4) */   a : i32;
/* offset(68) align( 1) size(12) */   // -- implicit struct size padding --;
/*                               */ };)");
}

TEST_F(StructTest, Location) {
    auto* st = Structure("st", utils::Vector{
                                   Member("a", ty.i32(), utils::Vector{Location(1_u)}),
                                   Member("b", ty.u32()),
                               });

    auto p = Build();
    ASSERT_TRUE(p.IsValid()) << p.Diagnostics().str();

    auto* sem = p.Sem().Get(st);
    ASSERT_EQ(2u, sem->Members().Length());

    EXPECT_TRUE(sem->Members()[0]->Location().has_value());
    EXPECT_EQ(sem->Members()[0]->Location().value(), 1u);

    EXPECT_FALSE(sem->Members()[1]->Location().has_value());
}

TEST_F(StructTest, IsConstructable) {
    auto* inner =  //
        Structure("Inner", utils::Vector{
                               Member("a", ty.i32()),
                               Member("b", ty.u32()),
                               Member("c", ty.f32()),
                               Member("d", ty.vec3<f32>()),
                               Member("e", ty.mat4x2<f32>()),
                           });

    auto* outer = Structure("Outer", utils::Vector{
                                         Member("inner", ty.type_name("Inner")),
                                         Member("a", ty.i32()),
                                     });

    auto* outer_runtime_sized_array =
        Structure("OuterRuntimeSizedArray", utils::Vector{
                                                Member("inner", ty.type_name("Inner")),
                                                Member("a", ty.i32()),
                                                Member("runtime_sized_array", ty.array<i32>()),
                                            });
    auto p = Build();
    ASSERT_TRUE(p.IsValid()) << p.Diagnostics().str();

    auto* sem_inner = p.Sem().Get(inner);
    auto* sem_outer = p.Sem().Get(outer);
    auto* sem_outer_runtime_sized_array = p.Sem().Get(outer_runtime_sized_array);

    EXPECT_TRUE(sem_inner->IsConstructible());
    EXPECT_TRUE(sem_outer->IsConstructible());
    EXPECT_FALSE(sem_outer_runtime_sized_array->IsConstructible());
}

TEST_F(StructTest, HasCreationFixedFootprint) {
    auto* inner =  //
        Structure("Inner", utils::Vector{
                               Member("a", ty.i32()),
                               Member("b", ty.u32()),
                               Member("c", ty.f32()),
                               Member("d", ty.vec3<f32>()),
                               Member("e", ty.mat4x2<f32>()),
                               Member("f", ty.array<f32, 32>()),
                           });

    auto* outer = Structure("Outer", utils::Vector{
                                         Member("inner", ty.type_name("Inner")),
                                     });

    auto* outer_with_runtime_sized_array =
        Structure("OuterRuntimeSizedArray", utils::Vector{
                                                Member("inner", ty.type_name("Inner")),
                                                Member("runtime_sized_array", ty.array<i32>()),
                                            });

    auto p = Build();
    ASSERT_TRUE(p.IsValid()) << p.Diagnostics().str();

    auto* sem_inner = p.Sem().Get(inner);
    auto* sem_outer = p.Sem().Get(outer);
    auto* sem_outer_with_runtime_sized_array = p.Sem().Get(outer_with_runtime_sized_array);

    EXPECT_TRUE(sem_inner->HasCreationFixedFootprint());
    EXPECT_TRUE(sem_outer->HasCreationFixedFootprint());
    EXPECT_FALSE(sem_outer_with_runtime_sized_array->HasCreationFixedFootprint());
}

TEST_F(StructTest, HasFixedFootprint) {
    auto* inner =  //
        Structure("Inner", utils::Vector{
                               Member("a", ty.i32()),
                               Member("b", ty.u32()),
                               Member("c", ty.f32()),
                               Member("d", ty.vec3<f32>()),
                               Member("e", ty.mat4x2<f32>()),
                               Member("f", ty.array<f32, 32>()),
                           });

    auto* outer = Structure("Outer", utils::Vector{
                                         Member("inner", ty.type_name("Inner")),
                                     });

    auto* outer_with_runtime_sized_array =
        Structure("OuterRuntimeSizedArray", utils::Vector{
                                                Member("inner", ty.type_name("Inner")),
                                                Member("runtime_sized_array", ty.array<i32>()),
                                            });

    auto p = Build();
    ASSERT_TRUE(p.IsValid()) << p.Diagnostics().str();

    auto* sem_inner = p.Sem().Get(inner);
    auto* sem_outer = p.Sem().Get(outer);
    auto* sem_outer_with_runtime_sized_array = p.Sem().Get(outer_with_runtime_sized_array);

    EXPECT_TRUE(sem_inner->HasFixedFootprint());
    EXPECT_TRUE(sem_outer->HasFixedFootprint());
    EXPECT_FALSE(sem_outer_with_runtime_sized_array->HasFixedFootprint());
}

}  // namespace
}  // namespace tint::sem
