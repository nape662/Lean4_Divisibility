import Lake
open Lake DSL

package «leanproject» where
  -- Settings applied to both builds and interactive editing
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩, -- pretty-prints `fun a ↦ b`
    ⟨`pp.proofs.withType, false⟩
  ]
  -- add any additional package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

require mdgen from git
  "https://github.com/Seasawher/mdgen" @ "main"
    -- use it running `lake exe mdgen <input_dir> <output_dir>`

@[default_target]
lean_lib «Leanproject» where
  -- add any library configuration options here
