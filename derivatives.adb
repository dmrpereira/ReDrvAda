package body Derivatives is
   
   function Drv(X:in Re_Access;S:in Sy) return Re_Access is
   begin
      if X'Tag in Re0'Tag then
	 return Make_Re0;
      elsif X'Tag in Re1'Tag then
	 return Make_Re0;
      elsif X'Tag in Re_Sy'Tag then
	 if Get_Re_Sy(Re_Sy(X.all)) = S then
	    return Make_Re1;
	 else
	    return Make_Re0;
	 end if;
      elsif X'Tag in Re_U'Tag then
	 return Make_Re_U(Drv(Get_Left_Re(Re_U(X.all)),S),Drv(Get_Right_Re(Re_U(X.all)),S));
      elsif X'Tag in Re_C'Tag then
	 declare
	    T : Re_Access := Get_Left_Re(Re_C(X.all));
	 begin
	    if Nullable(Re_Type'Class(T.all)) then
	       return Make_Re_U(Make_Re_C(Drv(Get_Left_Re(Re_C(X.all)),S),
					  Get_Right_Re(Re_C(X.all))),
				Drv(Get_Right_Re(Re_C(X.all)),S));
	    else
	       return Make_Re_C(Drv(Get_Left_Re(Re_C(X.all)),S),Get_Right_Re(Re_C(X.all)));
	    end if;
	 end;
      elsif X'Tag in Re_S'Tag then
	 return Make_Re_C(Drv(Get_Re_Stared(Re_S(X.all)),S),X);
      else
	 return null;
      end if;
   end Drv;
    
   function Accepts(X:in Re_Access;W:in Word;N:in Natural) return Boolean is
      Y : Re_Access := null;
      I : Natural := 0;
   begin
      Y := X;
      while I < N loop
	 Y := Drv(Y,W(I));
	 I := I + 1;
      end loop;
      return Y.Nullable;
   end Accepts;
   
   
      
end Derivatives;
