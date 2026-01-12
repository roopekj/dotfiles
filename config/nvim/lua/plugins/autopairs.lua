-- When inserting a character that occurs in pairs, like a bracket, add the other pair automatically
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {},
}
