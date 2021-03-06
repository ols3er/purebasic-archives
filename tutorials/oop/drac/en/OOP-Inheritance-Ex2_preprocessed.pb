; ******************************************************************************
; *                                                                            *
; *                   "OOP-Inheritance-Ex2.pb" Pre-Processed                   *
; *                                                                            *
; ******************************************************************************
; This file is the pre-processed version of "OOP-Inheritance-Ex2.pb":
;  -- It contains all its external included files,
;  -- All macros are expanded: original macro is kept as comment (single ";")
;     next to the code it produced during expansion.
;  -- Original comments are preserved (double ";")
;
; It was generated by Tristano Ajmone, with the purpose of simplifying analysis
; of the original source. Created via PureBASIC compiler with "/PREPROCESS" and
; "--commented" options.
; ------------------------------------------------------------------------------

; ; ������������������������������������������������������������������������������
; ; ������������������������������������������������������������������������������
; ; ������������������������ OOP Inheritance in PureBASIC ������������������������
; ; ������������������������������������������������������������������������������
; ; ��������������������������������� Example 2 ����������������������������������
; ; ������������������������������������������������������������������������������
; ; ������������������������������������������������������������������������������
; ; by Dr�c, (c) Sept 2007.
; ; ------------------------------------------------------------------------------
; ; "OOP-Inheritance-Ex2.pb"
; ; �PureBASIC Archives� release v1.1, December 6, 2016
; ; (first reprint: in January 9, 2016)
; ;
; ; Minor changes to the original code, by Tristano Ajmone (@tajmone):
; ;   -- renamed some vars, procedures
; ;   -- added/changed source comments
; ;   -- removed French comments
; ; ------------------------------------------------------------------------------
; ; Released under Creative Common Attribution (CC BY 4.0) license:
; ;   -- https://creativecommons.org/licenses/by/4.0/
; ; ------------------------------------------------------------------------------
; ; original file: "OOP_Inheritance.pb"
; ;   -- http://drac.site.chez.tiscali.fr/Tutorials Programming PureBasic/indexTutorials.htm#POO 
; ; ==============================================================================
; ;                                  DESCRIPTION                                  
; ; ==============================================================================
; ; This example shows how a concrete Class ('Rect1') inherits from an abstract
; ; Class ('Shape').
; ; It also shows how to access an object�s attributes: either by Methods, or by
; ; �embedded� mutators (getter an setter accessors). 
; ; ------------------------------------------------------------------------------
; 
; XIncludeFile "OOP.pbi"
; ;=======================================================================
; ; OOP
; ;
; ; A set of instructions to equip PureBasic with
; ; OOP concepts. It is a possible implementation
; ; allowing basic concepts as:
; ; - instanciation,
; ; - encapsulation,
; ; - simple inheritance,
; ; - overload,
; ; - abstract/concret Classes,
; ; - composition/agregation.
; ;
; ; Dr�c -  Oct 2007 : * Init_Mbers:EndInit_Mbers block became a private
; ;                      block of the OOP implementation used by a new
; ;                      block New:EndNew.
; ;                    * Externalisation of the header from Method, New &
; ;                      Free macros for an easy service.
; ;                    * Additional macros to an easy declaration of
; ;                      Methods, New and Free (DeclareMethods, DeclareNew
; ;                      DeclareFree)
; ; Dr�c - Sept 2007 : creation
; ;=======================================================================
; 
; Macro Mtd
Macro Mtd
;   *this\Instance\Md
  *this\Instance\Md
; EndMacro
EndMacro
; 
; ;///////////////////////////////////////////////////////
; ; OBJECT CLASS
; ;///////////////////////////////////////////////////////
; 
; ;-------------------------------- Class --------------------------------
; ;
; ; Object class declaration.
; ;
; ; Syntax:
; ;         Class(ClassName)
; ;           [Mthd1()]
; ;           [Mthd2()]        <-- Interface declaration
; ;           ...
; ;         Methods(ClassName)
; ;           [<*Mthd1>]
; ;           [<*Mthd2>]       <-- methods table declaration
; ;           ...
; ;         Members(ClassName)
; ;           [<variable1>]    <-- members declaration
; ;           ...
; ;         EndClass(ClassName)
; ;------------------------------------------------------------------------
; Macro Class(ClassName)
Macro Class(ClassName)
;   ; Declare the class interface
  
;   Interface ClassName#_ 
  Interface ClassName#_ 
;   EndMacro
  EndMacro
;   Macro Methods(ClassName) 
  Macro Methods(ClassName) 
;   EndInterface 
  EndInterface 
;   ; Declare the methods table structure
  
;   Structure Mthds_#ClassName 
  Structure Mthds_#ClassName 
;   EndMacro
  EndMacro
;   Macro Members(ClassName) 
  Macro Members(ClassName) 
;   EndStructure
  EndStructure
;   ; Create the methods table
  
;   Mthds_#ClassName.Mthds_#ClassName
  Mthds_#ClassName.Mthds_#ClassName
;   ; Declare the members
  
;   ; No parent class: implement pointers for the Methods and the instance
  
;   Structure Mbrs_#ClassName#_
  Structure Mbrs_#ClassName#_
;     *Methods
    *Methods
;   EndMacro 
  EndMacro 
;   Macro EndClass(ClassName)
  Macro EndClass(ClassName)
;   EndStructure
  EndStructure
;   Structure Mbrs_#ClassName Extends Mbrs_#ClassName#_
  Structure Mbrs_#ClassName Extends Mbrs_#ClassName#_
;     *Instance.ClassName
    *Instance.ClassName
;   EndStructure
  EndStructure
;   ; Merges methods and members into an StructureUnion in order to
  
;   ; symetrize their use and to benefit of 'automatic accessors'
  
;   ; Syntax:
  
;   ;         Object\Md\Method() to use method
  
;   ;         Object\Mb\Member to access a member
  
;   Structure ClassName
  Structure ClassName
;     StructureUnion
    StructureUnion
;       *Md.ClassName#_     ; The methods
      *Md.ClassName#_     
;       *Mb.Mbrs_#ClassName ; The menbers
      *Mb.Mbrs_#ClassName 
;     EndStructureUnion
    EndStructureUnion
;   EndStructure
  EndStructure
; EndMacro
EndMacro
; 
; ;------------------------------- ClassEx -------------------------------
; ;
; ; Object class declaration.
; ; Use when the object inherite from an other class.
; ;
; ; Syntax:
; ;         ClassEx(ClassName, MotherClass)
; ;           [Mthd1()]
; ;           [Mthd2()]                       <-- Interface declaration
; ;           ...
; ;         MethodsEx(ClassName, MotherClass)
; ;           [<*Mthd1>]
; ;           [<*Mthd2>]                      <-- methods table declaration
; ;           ...
; ;         MembersEx(ClassName, MotherClass)
; ;           [<variable1>]                   <-- members declaration
; ;           ...
; ;         EndClass(ClassName)
; ;------------------------------------------------------------------------
; Macro ClassEx(ClassName, MotherClass)
Macro ClassEx(ClassName, MotherClass)
;   ; Declare the class interface extended from the parent class
  
;   Interface ClassName#_ Extends MotherClass#_
  Interface ClassName#_ Extends MotherClass#_
;   EndMacro
  EndMacro
;   Macro MethodsEx(ClassName, MotherClass) 
  Macro MethodsEx(ClassName, MotherClass) 
;   EndInterface
  EndInterface
;   ; Declare the methods table structure extended from the parent class 
  
;   Structure Mthds_#ClassName Extends Mthds_#MotherClass
  Structure Mthds_#ClassName Extends Mthds_#MotherClass
;   EndMacro
  EndMacro
;   Macro MembersEx(ClassName, MotherClass)  
  Macro MembersEx(ClassName, MotherClass)  
;   EndStructure
  EndStructure
;   ; Create the methods table
  
;   ; and initialize first with the methods from the parent class
  
;   Mthds_#ClassName.Mthds_#ClassName
  Mthds_#ClassName.Mthds_#ClassName
;   CopyMemory(@Mthds_#MotherClass, Mthds_#ClassName, SizeOf(Mthds_#MotherClass))
  CopyMemory(@Mthds_#MotherClass, Mthds_#ClassName, SizeOf(Mthds_#MotherClass))
;   ; Declare the members extended from the parent class
  
;   Structure Mbrs_#ClassName#_ Extends Mbrs_#MotherClass#_
  Structure Mbrs_#ClassName#_ Extends Mbrs_#MotherClass#_
;   EndMacro
  EndMacro
;   
;   
;   ;///////////////////////////////////////////////////////
;   ; OBJECT METHODS
;   ;///////////////////////////////////////////////////////
;   ; private macro
;   Macro MethodHeader(ClassName, Mthd)  ; Header of the Method
  Macro MethodHeader(ClassName, Mthd)  
;     Mthd#_#ClassName(*this.Mbrs_#ClassName 
    Mthd#_#ClassName(*this.Mbrs_#ClassName 
;   EndMacro
  EndMacro
;   ;-------------------------------- Method --------------------------------
;   ;
;   ; Object method implementation.
;   ;
;   ; Syntax:
;   ;         Method(ClassName, Mthd) [,<variable1 [= DefaultValue]>,...])
;   ;           ...
;   ;           [ProcedureReturn value]
;   ;         EndMethod(ClassName, Mthd)
;   ;------------------------------------------------------------------------
;   
;   Macro DeclareMethod(ClassName, Mthd) 
  Macro DeclareMethod(ClassName, Mthd) 
;     Declare MethodHeader(ClassName, Mthd)
    Declare MethodHeader(ClassName, Mthd)
;   EndMacro
  EndMacro
;   
;   Macro Method(ClassName, Mthd) 
  Macro Method(ClassName, Mthd) 
;     Procedure MethodHeader(ClassName, Mthd)
    Procedure MethodHeader(ClassName, Mthd)
;     EndMacro
    EndMacro
;     Macro EndMethod(ClassName, Mthd)
    Macro EndMethod(ClassName, Mthd)
;     EndProcedure
    EndProcedure
;     ; Save the method adress into the methods table
    
;     Mthds_#ClassName\Mthd=@Mthd#_#ClassName()
    Mthds_#ClassName\Mthd=@Mthd#_#ClassName()
;   EndMacro
  EndMacro
;   
;   ;///////////////////////////////////////////////////////
;   ; OBJECT INITIALISATION
;   ;///////////////////////////////////////////////////////
;   ; private macros
;   Macro Declared_Init_Mbers_Arg(ClassName) ; for an easy service of the Init_Mbers argument declared
  Macro Declared_Init_Mbers_Arg(ClassName) 
;     *input.Mbrs_#ClassName =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0
    *input.Mbrs_#ClassName =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0
;   EndMacro
  EndMacro
;   Macro Used_Init_Mbers_Arg()              ; for an easy service of the Init_Mbers argument used
  Macro Used_Init_Mbers_Arg()              
;     *input, arg1, arg2, arg3, arg4, arg5
    *input, arg1, arg2, arg3, arg4, arg5
;   EndMacro
  EndMacro
;   
;   ;----------------------------- Init_Mbers -------------------------------
;   ;
;   ; Object members initialization.
;   ; Used by the New method
;   ;
;   ; Syntax:
;   ;         Init_Mbers(ClassName)
;   ;           ...
;   ;         EndInit_Mbers
;   ;------------------------------------------------------------------------
;   Macro Init_Mbers(ClassName)
  Macro Init_Mbers(ClassName)
;     Method(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
    Method(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
;   EndMacro
  EndMacro
;   Macro EndInit_Mbers()
  Macro EndInit_Mbers()
;   EndProcedure
  EndProcedure
; EndMacro
EndMacro
; 
; ;---------------------------- Init_MbersEx ------------------------------
; ;
; ; Object members initialization.
; ; Used by the New method when the object inherite from an other class.
; ;
; ; Syntax:
; ;         Init_MbersEx(ClassName, MotherClass)
; ;           ...
; ;         EndInit_Mbers
; ;------------------------------------------------------------------------
; Macro Init_MbersEx(ClassName, MotherClass)
Macro Init_MbersEx(ClassName, MotherClass)
;   Init_Mbers(ClassName)
  Init_Mbers(ClassName)
;   ; Call the object initialization method of the parent class
  
;   Init_Mbers_#MotherClass(*this, Used_Init_Mbers_Arg())
  Init_Mbers_#MotherClass(*this, Used_Init_Mbers_Arg())
; EndMacro
EndMacro
; 
; ;///////////////////////////////////////////////////////
; ; OBJECT CONSTRUCTORS
; ;///////////////////////////////////////////////////////
; ; private macro
; Macro New_body(ClassName)   ; Common body of a New method
Macro New_body(ClassName)   
;   Shared Mthds_#ClassName
  Shared Mthds_#ClassName
;   ; Allocate the memory required for the object members
  
;   *this.Mbrs_#ClassName = AllocateMemory(SizeOf(Mbrs_#ClassName))
  *this.Mbrs_#ClassName = AllocateMemory(SizeOf(Mbrs_#ClassName))
;   ; Attach the methods table to the object
  
;   *this\Methods=@Mthds_#ClassName
  *this\Methods=@Mthds_#ClassName
;   ; The object is created than initialized (like this, aggregated/composite objects are available during init)
  
;   ; Create the object
  
;   *this\Instance= AllocateMemory(SizeOf(ClassName))
  *this\Instance= AllocateMemory(SizeOf(ClassName))
;   *this\Instance\Md = *this
  *this\Instance\Md = *this
;   ; Now init members 
  
;   Init_Mbers_#ClassName(*this, Used_Init_Mbers_Arg())
  Init_Mbers_#ClassName(*this, Used_Init_Mbers_Arg())
; EndMacro
EndMacro
; Macro NewHeader(ClassName)  ; Header of the New method
Macro NewHeader(ClassName)  
;   New_#ClassName(Declared_Init_Mbers_Arg(ClassName))
  New_#ClassName(Declared_Init_Mbers_Arg(ClassName))
; EndMacro
EndMacro
; 
; Macro FreeHeader(ClassName) ; Header of the Free method
Macro FreeHeader(ClassName) 
;   Free_#ClassName(*Instance.ClassName)
  Free_#ClassName(*Instance.ClassName)
; EndMacro
EndMacro
; 
; ;-------------------------------- New -----------------------------------
; ;
; ; Object  constructor.
; ; Return the adress of the new instance.
; ;
; ; INPUT:
; ; Input data by referent.
; ;
; ; Syntax:
; ;         New(ClassName)
; ;           ...
; ;         EndNew
; ; Use:
; ;         *Object.ClassName = New_ClassName([*input])
; ;------------------------------------------------------------------------
; Macro DeclareNew(ClassName) ; Used to declare a New method
Macro DeclareNew(ClassName) 
;   Declare NewHeader(ClassName)
  Declare NewHeader(ClassName)
; EndMacro
EndMacro
; 
; Macro New(ClassName)
Macro New(ClassName)
;   DeclareMethod(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
  DeclareMethod(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
;   Procedure.l NewHeader(ClassName)
  Procedure.l NewHeader(ClassName)
;     New_body(ClassName)
    New_body(ClassName)
;     ProcedureReturn *this\Instance  
    ProcedureReturn *this\Instance  
;   EndProcedure
  EndProcedure
;   Init_Mbers(ClassName)
  Init_Mbers(ClassName)
; EndMacro
EndMacro
; Macro EndNew
Macro EndNew
;   EndInit_Mbers()
  EndInit_Mbers()
; EndMacro
EndMacro
; 
; ;-------------------------------- NewEx -----------------------------------
; ;
; ; Object  constructor.
; ; Return the adress of the new instance.
; ;
; ; INPUT:
; ; Input data by referent.
; ;
; ; Syntax:
; ;         NewEx(ClassName, MotherClass)
; ;           ...
; ;         EndNew
; ;
; ; Use: (idem than New() method above)
; ;
; ;         *Object.ClassName = New_ClassName([*input])
; ;------------------------------------------------------------------------
; Macro NewEx(ClassName, MotherClass)
Macro NewEx(ClassName, MotherClass)
;   DeclareMethod(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
  DeclareMethod(ClassName, Init_Mbers), Declared_Init_Mbers_Arg(ClassName))
;   Procedure.l NewHeader(ClassName)
  Procedure.l NewHeader(ClassName)
;     New_body(ClassName)
    New_body(ClassName)
;     ProcedureReturn *this\Instance  
    ProcedureReturn *this\Instance  
;   EndProcedure
  EndProcedure
;   Init_MbersEx(ClassName, MotherClass)
  Init_MbersEx(ClassName, MotherClass)
; EndMacro
EndMacro
; 
; ;------------------------------- Free -----------------------------------
; ;
; ; Object destructor.
; ;
; ; INPUT:
; ; Require the object instance.
; ;
; ; !! Don't forget to free all aggregated/composite objects here !!
; ;
; ; Syntax:
; ;         Free(ClassName)
; ;           ...
; ;         EndFree
; ;
; ; Use:
; ;         Free_ClassName(*Object.ClassName)
; ;------------------------------------------------------------------------
; Macro DeclareFree(ClassName); Used to declare a Free method
Macro DeclareFree(ClassName)
;   Declare FreeHeader(ClassName)
  Declare FreeHeader(ClassName)
; EndMacro
EndMacro
; 
; Macro Free(ClassName)
Macro Free(ClassName)
;   Procedure FreeHeader(ClassName)
  Procedure FreeHeader(ClassName)
;     If *Instance
    If *Instance
;     EndMacro
    EndMacro
;     Macro EndFree
    Macro EndFree
;       FreeMemory(*Instance\Md)
      FreeMemory(*Instance\Md)
;       FreeMemory(*Instance)
      FreeMemory(*Instance)
;     EndIf
    EndIf
;   EndProcedure
  EndProcedure
; EndMacro
EndMacro
; 
; 
; ;=====================================================
; ; Abstract Class Shape
; ;
; ;=====================================================
; Class(Shape)
Interface Shape_ 
;   Draw() 
  Draw() 
;   Cut() 
  Cut() 
;   Get_var1()                ; <-- Abstract class : the Get_var1() method is not implemented into Shape Class
  Get_var1()                
;   Get_var2()    
  Get_var2()    
;   Methods(Shape)
EndInterface 
Structure Mthds_Shape 
;     *Draw
    *Draw
;     *Cut
    *Cut
;     *Get_var1
    *Get_var1
;     *Get_var2
    *Get_var2
;   Members(Shape)
EndStructure
Mthds_Shape.Mthds_Shape
Structure Mbrs_Shape_
*Methods
;     var1.l 
    var1.l 
;     var2.l
    var2.l
; EndClass(Shape)
EndStructure
Structure Mbrs_Shape Extends Mbrs_Shape_
*Instance.Shape
EndStructure
Structure Shape
StructureUnion
*Md.Shape_     
*Mb.Mbrs_Shape 
EndStructureUnion
EndStructure
; 
; Method(Shape, Draw))
Procedure Draw_Shape(*this.Mbrs_Shape )
;   Debug "Draw from Shape Class" 
  Debug "Draw from Shape Class" 
; EndMethod(Shape, Draw)
EndProcedure
Mthds_Shape\Draw=@Draw_Shape()
; 
; Method(Shape, Cut))
Procedure Cut_Shape(*this.Mbrs_Shape )
;   Debug "Cut from Shape Class" 
  Debug "Cut from Shape Class" 
; EndMethod(Shape, Cut)
EndProcedure
Mthds_Shape\Cut=@Cut_Shape()
; 
; Method(Shape, Get_var2))
Procedure Get_var2_Shape(*this.Mbrs_Shape )
;   With *this
  With *this
;     ProcedureReturn \var2 
ProcedureReturn *this\var2 
;   EndWith
  EndWith
; EndMethod(Shape, Get_var2)
EndProcedure
Mthds_Shape\Get_var2=@Get_var2_Shape()
; 
; New(Shape) 
Declare Init_Mbers_Shape(*this.Mbrs_Shape , *input.Mbrs_Shape =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0)
Procedure.l New_Shape(*input.Mbrs_Shape =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0)
Shared Mthds_Shape
*this.Mbrs_Shape = AllocateMemory(SizeOf(Mbrs_Shape))
*this\Methods=@Mthds_Shape
*this\Instance= AllocateMemory(SizeOf(Shape))
*this\Instance\Md = *this
Init_Mbers_Shape(*this, *input, arg1, arg2, arg3, arg4, arg5)
ProcedureReturn *this\Instance  
EndProcedure
Procedure Init_Mbers_Shape(*this.Mbrs_Shape , *input.Mbrs_Shape =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0) 
;   With *this
  With *this
;     \var1= *input\var1 
*this\var1= *input\var1 
;     \var2= *input\var2
*this\var2= *input\var2
;   EndWith
  EndWith
; EndNew
EndProcedure
; 
; ; New(Shape)                ; <-- Abstract class : New and Free constructors are not required
; ; Free(Shape)
; ; EndFree
; 
; ; ---------------------------------- 
; 
; ;=====================================================
; ; Concrete Class Rect1
; ;
; ;=====================================================
; ClassEx(Rect1, Shape)       ; <-- Inheritance
Interface Rect1_ Extends Shape_       
;   Erase() 
  Erase() 
;   Get_var4()
  Get_var4()
;   MethodsEx(Rect1, Shape)   ; <-- Inheritance
EndInterface
Structure Mthds_Rect1 Extends Mthds_Shape   
;     *Erase
    *Erase
;     *Get_var4
    *Get_var4
;   MembersEx(Rect1, Shape)   ; <-- Inheritance
EndStructure
Mthds_Rect1.Mthds_Rect1
CopyMemory(@Mthds_Shape, Mthds_Rect1, SizeOf(Mthds_Shape))
Structure Mbrs_Rect1_ Extends Mbrs_Shape_   
;     var3.l 
    var3.l 
;     var4.l 
    var4.l 
;     rectname.s
    rectname.s
; EndClass(Rect1)
EndStructure
Structure Mbrs_Rect1 Extends Mbrs_Rect1_
*Instance.Rect1
EndStructure
Structure Rect1
StructureUnion
*Md.Rect1_     
*Mb.Mbrs_Rect1 
EndStructureUnion
EndStructure
; 
; Method(Rect1, Draw))        ; <-- Polymorphism : Rect1 Class implement its own Draw() method
Procedure Draw_Rect1(*this.Mbrs_Rect1 )        
;   Debug "Draw from Rect Class: " + *this\rectname 
  Debug "Draw from Rect Class: " + *this\rectname 
; EndMethod(Rect1, Draw)
EndProcedure
Mthds_Rect1\Draw=@Draw_Rect1()
; 
; Method(Rect1, Erase))
Procedure Erase_Rect1(*this.Mbrs_Rect1 )
;   Debug "Erase from Rect Class: " + *this\rectname
  Debug "Erase from Rect Class: " + *this\rectname
; EndMethod(Rect1, Erase)
EndProcedure
Mthds_Rect1\Erase=@Erase_Rect1()
; 
; Method(Rect1, Get_var1))    ; <-- Concrete class : all the methods of the Rect1 Class are implemented
Procedure Get_var1_Rect1(*this.Mbrs_Rect1 )    
;   With *this
  With *this
;     ProcedureReturn \var1 
ProcedureReturn *this\var1 
;   EndWith
  EndWith
; EndMethod(Rect1, Get_var1)
EndProcedure
Mthds_Rect1\Get_var1=@Get_var1_Rect1()
; 
; Method(Rect1, Get_var4))
Procedure Get_var4_Rect1(*this.Mbrs_Rect1 )
;   With *this
  With *this
;     ProcedureReturn \var4 
ProcedureReturn *this\var4 
;   EndWith
  EndWith
; EndMethod(Rect1, Get_var4)
EndProcedure
Mthds_Rect1\Get_var4=@Get_var4_Rect1()
; 
; NewEx(Rect1, Shape)         ; <-- Concrete class : constructor and destructor exist
Declare Init_Mbers_Rect1(*this.Mbrs_Rect1 , *input.Mbrs_Rect1 =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0)
Procedure.l New_Rect1(*input.Mbrs_Rect1 =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0)
Shared Mthds_Rect1
*this.Mbrs_Rect1 = AllocateMemory(SizeOf(Mbrs_Rect1))
*this\Methods=@Mthds_Rect1
*this\Instance= AllocateMemory(SizeOf(Rect1))
*this\Instance\Md = *this
Init_Mbers_Rect1(*this, *input, arg1, arg2, arg3, arg4, arg5)
ProcedureReturn *this\Instance  
EndProcedure
Procedure Init_Mbers_Rect1(*this.Mbrs_Rect1 , *input.Mbrs_Rect1 =0, arg1.l=0, arg2.l=0, arg3.l=0, arg4.l=0, arg5.l=0)
Init_Mbers_Shape(*this, *input, arg1, arg2, arg3, arg4, arg5)         
;   With *this
  With *this
;     \var4= *input\var4 
*this\var4= *input\var4 
;     \rectname= *input\rectname
*this\rectname= *input\rectname
;   EndWith
  EndWith
; EndNew
EndProcedure
; 
; Free(Rect1)
Procedure Free_Rect1(*Instance.Rect1)
If *Instance
; EndFree
FreeMemory(*Instance\Md)
FreeMemory(*Instance)
EndIf
EndProcedure
; 
; ; ---------------------------------- 
; 
; input.Mbrs_Rect1
input.Mbrs_Rect1
; With input
With input
;   \var1=1
 input\var1=1
;   \var2=2
 input\var2=2
;   \var4=6
 input\var4=6
;   \rectname="RectA"
 input\rectname="RectA"
; EndWith
EndWith
; *RectA.Rect1 = New_Rect1(input)
*RectA.Rect1 = New_Rect1(input)
; 
; With input
With input
;   \var1=3
 input\var1=3
;   \var2=4
 input\var2=4
;   \var4=7
 input\var4=7
;   \rectname="RectB"
 input\rectname="RectB"
; EndWith
EndWith
; *RectB.Rect1 = New_Rect1(input)
*RectB.Rect1 = New_Rect1(input)
; 
; Debug ">> Method Test" 
Debug ">> Method Test" 
; 
; *RectA\Md\Draw() 
*RectA\Md\Draw() 
; *RectA\Md\Cut() 
*RectA\Md\Cut() 
; *RectA\Md\Erase() 
*RectA\Md\Erase() 
; 
; *RectB\Md\Draw() 
*RectB\Md\Draw() 
; 
; Debug"" 
Debug"" 
; Debug ">> Access Test"
Debug ">> Access Test"
; 
; Debug""
Debug""
; Debug " <var1> of "+*RectA\Mb\rectname
Debug " <var1> of "+*RectA\Mb\rectname
; Debug *RectA\Mb\var1 
Debug *RectA\Mb\var1 
; Debug *RectA\Md\Get_var1() 
Debug *RectA\Md\Get_var1() 
; Debug " <var4> of "+*RectA\Mb\rectname
Debug " <var4> of "+*RectA\Mb\rectname
; Debug *RectA\Mb\var4 
Debug *RectA\Mb\var4 
; Debug *RectA\Md\Get_var4() 
Debug *RectA\Md\Get_var4() 
; 
; Debug""
Debug""
; Debug " <var1> of "+*RectB\Mb\rectname  
Debug " <var1> of "+*RectB\Mb\rectname  
; Debug *RectB\Mb\var1 
Debug *RectB\Mb\var1 
; Debug *RectB\Md\Get_var1() 
Debug *RectB\Md\Get_var1() 
; Debug " <var4> of "+*RectB\Mb\rectname 
Debug " <var4> of "+*RectB\Mb\rectname 
; Debug *RectB\Mb\var4 
Debug *RectB\Mb\var4 
; Debug *RectB\Md\Get_var4()  
Debug *RectB\Md\Get_var4()  
; 
; Debug"" 
Debug"" 
; Debug ">> Destruction Test" 
Debug ">> Destruction Test" 
; Free_Rect1(*RectA) 
Free_Rect1(*RectA) 
; Free_Rect1(*RectB) 
Free_Rect1(*RectB) 
; 
; ;*Rect1\Md\Draw()           ; --> Impossible to do because Rect object doesn't exist anymore! 
; 
