with Re;
with Re.Re0;
with Re.Re1;
with Re.Re_Sy;
with Re.Re_U;
with Re.Re_C;
with Re.Re_S;
with Words;
with Ada.Containers.Bounded_Ordered_Sets;

generic
   type Sy is private;
   with function "<"(S1:in Sy;S2:in Sy) return Boolean;
   with function String_Repr(X:in Sy) return String;

package Partial is

   package Re_Gen   is new Re(Sy,"<",String_Repr); use Re_Gen;
   package Re0_Gen  is new Re_Gen.Re0;             use Re0_Gen;
   package Re1_Gen  is new Re_Gen.Re1;             use Re1_Gen;
   package ReSy_Gen is new Re_Gen.Re_Sy;           use ReSy_Gen;
   package ReU_Gen  is new Re_Gen.Re_U;            use ReU_Gen;
   package ReC_Gen  is new Re_Gen.Re_C;            use ReC_Gen;
   package ReS_Gen  is new Re_Gen.Re_S;            use ReS_Gen;
   package Words_Gen is new Words(Sy,String_Repr); use Words_Gen;
   
   --type Word is array(Natural) of Sy;
   
   package Re_Access_Set is 
      new Ada.Containers.Bounded_Ordered_Sets(Element_Type => Re_Access,
					      "<" => Re_Gen.Re_Access_Lt);
   use Re_Access_Set;
   
   function Pdrv(X:in Re_Access;S:in Sy) return Set;
   
   function Accepts(X:in Re_Access;W:in Word) return Boolean;
   
private
   
   function Re_Set_Conc(S:in Set;R:in Re_Access) return Set;
   
   function Pdrv_Set(S:in Set;C:in Sy) return Set;
   
   function Nullable_Set(S:in Set) return Boolean;
      
end Partial;
