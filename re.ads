with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

generic
   type Sy is private;
   with function "<"(S1:in Sy;S2:in Sy) return Boolean;
   with function String_Repr(X:in Sy) return String;
   
package Re is

   type Re_Type is abstract tagged private;

   type Re_Access is access all Re_Type'Class;

   function "<"(R1:in Re_Type;R2:in Re_Type'Class) return Boolean is abstract;
   function "="(R1:in Re_Type;R2:in Re_Type'Class) return Boolean is abstract;
   
   function Re_Access_Eq(R1:in Re_Access;R2:in Re_Access) return Boolean;
   function Re_Access_Lt(R1:in Re_Access;R2:in Re_Access) return Boolean;

   function Print(R:in Re_Type) return Unbounded_String is abstract;
   
   function Nullable(R:in Re_Type) return Boolean is abstract;
   
private
   

   type Re_Type is abstract tagged 
      record
	 Re_Id : Natural;
      end record;

end Re;
