package body Re.Re_U is

   function Make_Re_U(R1,R2:in Re_Access) return Re_Access is
      Foo : Re_Access;
   begin
      Foo := new Re_U'(Re_Id => 3, Left_Re => R1, Right_Re => R2);
      return Foo;
   end Make_Re_U;

   function Get_Left_Re(R:in Re_U) return Re_Access is
   begin
      return R.Left_Re;
   end Get_Left_Re;

   function Get_Right_Re(R:in Re_U) return Re_Access is
   begin
      return R.Right_Re;
   end Get_Right_Re;

   function "<"(R1:in Re_U;R2:in Re_Type'Class) return Boolean is
   begin
      if R1.Re_Id < R2.Re_Id then
         return True;
      elsif R1.Re_Id = R2.Re_Id then
         if Re_Access_Eq(R1.Left_Re,Re_U(R2).Left_Re) then
            return (Re_Access_Lt(R1.Right_Re,Re_U(R2).Right_Re));
         else
            return (Re_Access_Lt(R1.Left_Re,Re_U(R2).Left_Re));
         end if;
      else
         return False;
      end if;
   end "<";

   function "="(R1:in Re_U;R2:in Re_Type'Class) return Boolean is
   begin
      if R2.Re_Id /= R1.Re_Id then
         return False;
      else
         return (Re_Access_Eq(R1.Left_Re,Re_U(R2).Left_Re)) and
           (Re_Access_Eq(R1.Right_Re,Re_U(R2).Right_Re));
      end if;
   end "=";

   function Nullable(R:in Re_U) return Boolean is
   begin
      return (Nullable(R.Left_Re.all) or Nullable(R.Right_Re.all));
   end Nullable;

   function Print(R:in Re_U) return Unbounded_String is
      Tmp : Unbounded_String := Null_Unbounded_String;
   begin
      Append(Tmp,"(");
      Append(Tmp,Print(R.Left_Re.all));
      Append(Tmp,")+(");
      Append(Tmp,Print(R.Right_Re.all));
      Append(Tmp,")");
      return Tmp;
   end Print;

end Re.Re_U;
