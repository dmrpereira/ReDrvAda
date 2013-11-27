with Re;
with Re.Re0;
with Re.Re1;
with Re.Re_Sy;
with Re.Re_U;
with Re.Re_C;
with Re.Re_S;
--with Re.Re_T;

generic
   type Sy is private;
   with function "<"(S1:in Sy;S2:in Sy) return Boolean;
   with function String_Repr(X:in Sy) return String;

package Derivatives is

   package Re_Gen   is new Re(Sy,"<",String_Repr); use Re_Gen;
   package Re0_Gen  is new Re_Gen.Re0;             use Re0_Gen;
   package Re1_Gen  is new Re_Gen.Re1;             use Re1_Gen;
   package ReSy_Gen is new Re_Gen.Re_Sy;           use ReSy_Gen;
   package ReU_Gen  is new Re_Gen.Re_U;            use ReU_Gen;
   package ReC_Gen  is new Re_Gen.Re_C;            use ReC_Gen;
   package ReS_Gen  is new Re_Gen.Re_S;            use ReS_Gen;

   function Drv(X:in Re_Access;S:in Sy) return Re_Access;
   
   type Word is array(Natural) of Sy;
   
   function Accepts(X:in Re_Access;W:in Word;N:in Natural) return Boolean;


end Derivatives;
