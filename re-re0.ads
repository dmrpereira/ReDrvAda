with Formal_Language.Re; --use Re;
--with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

generic

package Formal_Language.Re.Re0 is

   --use type Re.Re_Type;

   type Re0 is new Re_Type with private;

   function "<"(R1:in Re0;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re0;R2:in Re_Type'Class) return Boolean;

   function Make_Re0 return Re_Access;

   function Print(R:in Re0) return Unbounded_String;

   function Nullable(R:in Re0) return Boolean;

private

   type Re0 is new Re_Type with null record;

end Formal_Language.Re.Re0;
