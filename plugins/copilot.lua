return {
	"github/copilot.vim",
	lazy = false,
	config = function ()
		vim.g.copilot_assume_mapped = true
    	vim.g.coplilot_no_tab_map = 'v:true'
	end
}
