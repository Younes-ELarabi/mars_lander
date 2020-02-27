pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__soft_links_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "system__exception_table_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "ada__containers_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__io_exceptions_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "ada__strings_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__strings__maps_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings__maps__constants_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "interfaces__c_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__exceptions_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__object_reader_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "system__dwarf_lines_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__soft_links__initialize_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__traceback__symbolic_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__numerics_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__tags_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "ada__streams_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "interfaces__c__strings_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__file_control_block_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__finalization_root_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "ada__finalization_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__file_io_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__task_info_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "ada__calendar_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "ada__real_time_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__text_io_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "system__random_seed_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "system__tasking__initialization_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__tasking__protected_objects_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__tasking__protected_objects__entries_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__tasking__queuing_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "system__tasking__stages_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "flag_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "perlin_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "pidcontroller_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "display_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "display__image_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "display__basic_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "display__basic__glfonts_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "display__basic__utils_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "display__basic__fonts_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "collision_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "terrain_package_E");
   E237 : Short_Integer; pragma Import (Ada, E237, "vector_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "mars_lander_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "path_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "controller_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "simulation_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E239 := E239 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "path__finalize_spec");
      begin
         F1;
      end;
      E170 := E170 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "mars_lander__finalize_spec");
      begin
         F2;
      end;
      E225 := E225 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "terrain_package__finalize_spec");
      begin
         F3;
      end;
      E162 := E162 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "flag__finalize_spec");
      begin
         F4;
      end;
      E182 := E182 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F5;
      end;
      E148 := E148 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__text_io__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E154 := E154 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, True, False, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           False, False, False, True, False, True, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           True, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 2, 0, 5, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E008 := E008 + 1;
      Ada.Containers'Elab_Spec;
      E033 := E033 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E063 := E063 + 1;
      Ada.Strings'Elab_Spec;
      E047 := E047 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E049 := E049 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E053 := E053 + 1;
      Interfaces.C'Elab_Spec;
      E073 := E073 + 1;
      System.Exceptions'Elab_Spec;
      E018 := E018 + 1;
      System.Object_Reader'Elab_Spec;
      E075 := E075 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E042 := E042 + 1;
      System.Os_Lib'Elab_Body;
      E067 := E067 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E094 := E094 + 1;
      E010 := E010 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E032 := E032 + 1;
      Ada.Numerics'Elab_Spec;
      E005 := E005 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E142 := E142 + 1;
      Ada.Streams'Elab_Spec;
      E150 := E150 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E113 := E113 + 1;
      System.File_Control_Block'Elab_Spec;
      E158 := E158 + 1;
      System.Finalization_Root'Elab_Spec;
      E157 := E157 + 1;
      Ada.Finalization'Elab_Spec;
      E155 := E155 + 1;
      System.File_Io'Elab_Body;
      E154 := E154 + 1;
      System.Task_Info'Elab_Spec;
      E128 := E128 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E231 := E231 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E107 := E107 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E148 := E148 + 1;
      System.Random_Seed'Elab_Body;
      E229 := E229 + 1;
      System.Tasking.Initialization'Elab_Body;
      E178 := E178 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E164 := E164 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E182 := E182 + 1;
      System.Tasking.Queuing'Elab_Body;
      E184 := E184 + 1;
      System.Tasking.Stages'Elab_Body;
      E243 := E243 + 1;
      flag'elab_spec;
      E162 := E162 + 1;
      E235 := E235 + 1;
      E241 := E241 + 1;
      Display'Elab_Spec;
      E191 := E191 + 1;
      Display.Image'Elab_Body;
      E223 := E223 + 1;
      Display.Basic'Elab_Spec;
      Display.Basic.Utils'Elab_Spec;
      E208 := E208 + 1;
      E205 := E205 + 1;
      Display.Basic'Elab_Body;
      E203 := E203 + 1;
      Display.Basic.Glfonts'Elab_Body;
      E210 := E210 + 1;
      E190 := E190 + 1;
      terrain_package'elab_spec;
      E225 := E225 + 1;
      E237 := E237 + 1;
      Mars_Lander'Elab_Spec;
      E170 := E170 + 1;
      path'elab_spec;
      E239 := E239 + 1;
      controller'elab_spec;
      controller'elab_body;
      E160 := E160 + 1;
      simulation'elab_spec;
      simulation'elab_body;
      E245 := E245 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\flag.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\gl_gl_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\gl_glu_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\perlin.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\pidcontroller.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_blendmode_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_error_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_scancode_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\stdarg_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\stddef_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\stdint_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_stdinc_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_joystick_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_keycode_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_keyboard_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_pixels_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_rect_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_rwops_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_surface_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display-image.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_touch_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_gesture_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_events_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\sdl_video_h.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display-basic-utils.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display-basic-fonts.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display-basic.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\display-basic-glfonts.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\collision.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\terrain_package.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\vector.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\mars_lander.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\path.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\controller.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\simulation.o
   --   C:\Users\desca\dev\mars_lander_lab_withTask\obj\main.o
   --   -LC:\Users\desca\dev\mars_lander_lab_withTask\obj\
   --   -LC:\Users\desca\dev\mars_lander_lab_withTask\obj\
   --   -LC:\Users\desca\dev\mars_lander_lab_withTask\game_support\obj\
   --   -LC:\Users\desca\dev\mars_lander_lab_withTask\gnat_sdl\obj\
   --   -LC:\Users\desca\dev\mars_lander_lab_withTask\game_support\stm32f4\obj\
   --   -LC:/gnat/2019/lib/gcc/x86_64-pc-mingw32/8.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
