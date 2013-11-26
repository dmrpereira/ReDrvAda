package body Formal_Language.Re.Re_T is

   function Make_Re_T(S:in Re_Access;Ii,Ie:in Natural) return Re_Access is
      Foo : Re_Access;
   begin
      Foo := new Re_T'(Re_Id => 6, Timed_Re => S,Init_Interval => Ii,End_Interval => ie);
      return Foo;
   end Make_Re_T;

   function Get_Re_Timed(R:in Re_T) return Re_Access is
   begin
      return R.Timed_Re;
   end Get_Re_Timed;

   function Get_Init_Interval(R:in Re_T) return Natural is
   begin
      return R.Init_Interval;
   end Get_Init_Interval;

   function Get_End_Interval(R:in Re_T) return Natural is
   begin
      return R.End_Interval;
   end Get_End_Interval;

   function "<"(R1:in Re_T;R2:in Re_Type'Class) return Boolean is
   begin
      if R1.Re_Id < R2.Re_Id then
         return True;
      elsif R1.Re_Id = R2.Re_Id then
         return (R1.Init_Interval <= Re_T(R2).Init_Interval and
                   R1.End_Interval <= Re_T(R2).End_Interval and
                 Re_Access_Lt(R1.Timed_Re,Re_T(R2).Timed_Re));
      else
         return False;
      end if;
   end "<";

   function "="(R1:in Re_T;R2:in Re_Type'Class) return Boolean is
   begin
      if R2.Re_Id /= R1.Re_Id then
         return False;
      else
         return (R1.Init_Interval = Re_T(R2).Init_Interval and
                   R1.End_Interval = Re_T(R2).End_Interval and
                   Re_Access_Eq(R1.Timed_Re,Re_T(R2).Timed_Re));
      end if;
   end "=";

   function Nullable(R:in Re_T) return Boolean is
   begin
      return Nullable(Re_Type'Class(R.Timed_Re.all));
   end Nullable;

   function Print(R:in Re_T) return Unbounded_String is
      Str : Unbounded_String := Null_Unbounded_String;
   begin
      Append(Str,"<");
      Append(Str,Print(R.Timed_Re.all));
      Append(Str,">[");
      Append(Str,Natural'Image(R.Init_Interval));
      Append(Str,",");
      Append(Str,Natural'Image(R.End_Interval));
      Append(Str,"]");
      return Str;
   end Print;

end Formal_Language.Re.Re_T;
