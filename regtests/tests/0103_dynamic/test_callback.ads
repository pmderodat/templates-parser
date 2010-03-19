------------------------------------------------------------------------------
--                             Templates Parser                             --
--                                                                          --
--                     Copyright (C) 2005-2009, AdaCore                     --
--                                                                          --
--  This library is free software; you can redistribute it and/or modify    --
--  it under the terms of the GNU General Public License as published by    --
--  the Free Software Foundation; either version 2 of the License, or (at   --
--  your option) any later version.                                         --
--                                                                          --
--  This library is distributed in the hope that it will be useful, but     --
--  WITHOUT ANY WARRANTY; without even the implied warranty of              --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       --
--  General Public License for more details.                                --
--                                                                          --
--  You should have received a copy of the GNU General Public License       --
--  along with this library; if not, write to the Free Software Foundation, --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          --
--                                                                          --
--  As a special exception, if other files instantiate generics from this   --
--  unit, or you link this unit with other files to produce an executable,  --
--  this  unit  does not  by itself cause  the resulting executable to be   --
--  covered by the GNU General Public License. This exception does not      --
--  however invalidate any other reasons why the executable file  might be  --
--  covered by the  GNU Public License.                                     --
------------------------------------------------------------------------------

with Templates_Parser;

package Test_Callback is

   type Lazy_Tag is new Templates_Parser.Dynamic.Lazy_Tag with private;

   overriding procedure Value
     (L   : not null access Lazy_Tag;
      Var : String;
      S   : in out Templates_Parser.Translate_Set);

   type Log_Context is new Templates_Parser.Dynamic.Lazy_Tag with null record;

   overriding procedure Value
     (L   : not null access Log_Context;
      Var : String;
      S   : in out Templates_Parser.Translate_Set);

   type Cursor_Tag is new Templates_Parser.Dynamic.Cursor_Tag with null record;

   overriding function Dimension
     (C   : not null access Cursor_Tag;
      Var : String) return Natural;

   overriding function Length
     (C    : not null access Cursor_Tag;
      Var  : String;
      Path : Templates_Parser.Dynamic.Path) return Natural;

   overriding function Value
     (C    : not null access Cursor_Tag;
      Var  : String;
      Path : Templates_Parser.Dynamic.Path) return String;

private

   type Lazy_Tag is new Templates_Parser.Dynamic.Lazy_Tag with record
      N : Natural := 0;
   end record;

end Test_Callback;