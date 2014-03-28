--with Re;

generic

package Re.Re_C is

   type Re_C is new Re_Type with private;

   function "<"(R1:in Re_C;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re_C;R2:in Re_Type'Class) return Boolean;

   function Make_Re_C(R1,R2:in Re_Access) return Re_Access;

   function Get_Left_Re(R:in Re_C) return Re_Access;
   function Get_Right_Re(R:in Re_C) return Re_Access;

   function Nullable(R:in Re_C) return Boolean;

   function Print(R:in Re_C) return Unbounded_String;

private

   type Re_C is new Re_Type with
      record
         Left_Re : Re_Access;
         Right_Re : Re_Access;
      end record;

end Re.Re_C;
