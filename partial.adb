package body Partial is
   
   ----------------------------------------------------
   -- First come the two private auxiliary functions --
   ----------------------------------------------------
   
   function Re_Set_Conc(S:in Set;R:in Re_Access) return Set is
      NS : Set := Empty_Set;
      I : Cursor := First(S);
   begin
      while I /= Last(S) loop
	 Insert(NS,Make_Re_C(Element(I),R));
	 I := Next(I);
      end loop;
      return NS;
   end Re_Set_Conc;
   
   function Pdrv_Set(S:in Set;C:in Sy) return Set is
      NS : Set := Empty_Set;
      Tmp : Set := Empty_Set;
      I : Cursor := First(S);
      K : Cursor;
   begin
      while I /= Last(S) loop
	 Tmp := Pdrv(Element(I),C);
	 K := First(Tmp);
	 while K /= Last(Tmp) loop
	    Insert(NS,Element(K));
	    K := Next(K);
	 end loop;
	 I := Next(I);
      end loop;
      return NS;
   end Pdrv_Set;
   
   function Nullable_Set(S:in Set) return Boolean is
      I : Cursor := First(S);
   begin
      while I /= Last(S) loop
	 if not Element(I).Nullable then
	    return False;
	 end if;
	 I := Next(I);
      end loop;
      return True;
   end Nullable_Set;
         
   function Pdrv(X:in Re_Access;S:in Sy) return Set is
      
   begin
      if X'Tag in Re0'Tag then
	 return Empty_Set;
      elsif X'Tag in Re1'Tag then
	 return Empty_Set;
      elsif X'Tag in Re_Sy'Tag then
	 declare
	    Tmp : Set := Empty_Set;
	 begin
	    if Get_Re_Sy(Re_Sy(X.all)) = S then
	       Insert(Tmp,Make_Re1);
	    end if;
	    return Tmp;
	 end;
      elsif X'Tag in Re_U'Tag then
	 declare
	    Tmp1 : Set := Pdrv(Get_Left_Re(Re_U(X.all)),S);
	    Tmp2 : Set := Pdrv(Get_Right_Re(Re_U(X.all)),S);
	 begin
	    Union(Tmp1,Tmp2);
	    return Tmp1;
	 end;
      elsif X'Tag in Re_C'Tag then
     	 declare
	    T : Re_Access := Get_Left_Re(Re_C(X.all));
	    Tmp : Set := Re_Set_Conc(Pdrv(Get_Left_Re(Re_U(X.all)),S),Get_Right_Re(Re_C(X.all)));
	 begin
   	    if Nullable(Re_Type'Class(T.all)) then
	       Union(Tmp,Pdrv(Get_Right_Re(Re_C(X.all)),S));
	    end if;
	    return Tmp;
	 end;
      elsif X'Tag in Re_S'Tag then
     	 return Re_Set_Conc(Pdrv(Get_Re_Stared(Re_S(X.all)),S),X);
      else
	 return Empty_Set;
      end if;
   end Pdrv;
    
   function Accepts(X:in Re_Access;W:in Word) return Boolean is
      Tmp : Set := Empty_Set;
      V : Word := W;
   begin
      if Is_Nil(W) then
	 return X.Nullable;
      else
	 Insert(Tmp,X);
       	 while not Is_Nil(V) loop
	    Tmp := Pdrv_Set(Tmp,Head(V));
	    V := Tail(V);
	 end loop;
	 return Nullable_Set(Tmp);
      end if;
   end Accepts;
         
end Partial;
