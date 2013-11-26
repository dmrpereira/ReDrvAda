--with Re;
with Ada.Text_IO; use Ada.Text_IO;
generic

package Formal_Language.Re.Re_U is

   type Re_U is new Re_Type with private;

   function "<"(R1:in Re_U;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re_U;R2:in Re_Type'Class) return Boolean;

   function Make_Re_U(R1,R2:in Re_Access) return Re_Access;

   function Get_Left_Re(R:in Re_U) return Re_Access;
   function Get_Right_Re(R:in Re_U) return Re_Access;

   function Nullable(R:in Re_U) return Boolean;

   function Print(R:in Re_U) return Unbounded_String;

private

   type Re_U is new Re_Type with
      record
         Left_Re : Re_Access;
         Right_Re : Re_Access;
      end record;

end Formal_Language.Re.Re_U;
