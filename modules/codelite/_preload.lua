--
-- Name:        codelite/_preload.lua
-- Purpose:     Define the CodeLite action.
-- Author:      Ryan Pusztai
-- Modified by: Andrea Zanellato
--              Andrew Gough
--              Manu Evans
-- Created:     2013/05/06
-- Copyright:   (c) 2008-2015 Jess Perkins and the Premake project
--

	local p = premake

	p.api.register {
		name = "debugconnectcommands",
		scope = "config",
		kind = "list:string",
		tokens = true,
	}

	p.api.register {
		name = "debugextendedprotocol",
		scope = "config",
		kind = "boolean",
	}

	p.api.register {
		name = "debugport",
		scope = "config",
		kind = "integer",
	}

	p.api.register {
		name = "debugremotehost",
		scope = "config",
		kind = "string",
		tokens = true,
	}

	p.api.register {
		name = "debugsearchpaths",
		scope = "config",
		kind = "list:path",
		tokens = true,
	}

	p.api.register {
		name = "debugstartupcommands",
		scope = "config",
		kind = "list:string",
		tokens = true,
	}

	newaction
	{
		-- Metadata for the command line and help system

		trigger         = "codelite",
		shortname       = "CodeLite",
		description     = "Generate CodeLite project files",
		toolset         = "clang",

		-- The capabilities of this action

		valid_kinds     = { "ConsoleApp", "WindowedApp", "Makefile", "None", "SharedLib", "StaticLib", "Utility" },
		valid_languages = { "C", "C++" },
		valid_tools     = {
			cc = { "gcc", "clang", "msc" }
		},

		-- Workspace and project generation logic

		onWorkspace = function(wks)
			p.modules.codelite.generateWorkspace(wks)
		end,
		onProject = function(prj)
			p.modules.codelite.generateProject(prj)
		end,

		onCleanWorkspace = function(wks)
			p.modules.codelite.cleanWorkspace(wks)
		end,
		onCleanProject = function(prj)
			p.modules.codelite.cleanProject(prj)
		end,
		onCleanTarget = function(prj)
			p.modules.codelite.cleanTarget(prj)
		end,
	}


--
-- Decide when the full module should be loaded.
--

	return function(cfg)
		return (_ACTION == "codelite")
	end
