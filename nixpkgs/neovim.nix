{ config, ... }: {

	programs.neovim.enable = true;
			
	programs.neovim.configure.customLuaRC = ''
		
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      				
		vim.opt.guicursor =
        		"n:block-blinkon500-blinkoff500," ..
	      		"i:ver25-blinkon500-blinkoff500," ..
		       	"v:block-blinkon500-blinkoff500," ..
	 		"c:hor20-blinkon500-blinkoff500," ..
			"r:hor20-blinkon500-blinkoff500"	
	'';		
}
