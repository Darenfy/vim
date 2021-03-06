" Vim syntax file
" Language:	CVS commit file
" Maintainer:	Matt Dunford (zoot@zotikos.com)
" URL:		http://www.zotikos.com/downloads/cvs.vim
" Last Change:	Sat Nov 24 23:25:11 CET 2001

" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syn region cvsLine start="^CVS: " end="$" contains=cvsFile,cvsCom,cvsFiles,cvsTag
syn match cvsFile  contained " \t\(\(\S\+\) \)\+"
syn match cvsTag   contained " Tag:"
syn match cvsFiles contained "\(Added\|Modified\|Removed\) Files:"
syn region cvsCom start="Committing in" end="$" contains=cvsDir contained extend keepend
syn match cvsDir   contained "\S\+$"

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
command -nargs=+ HiLink hi def link <args>

HiLink cvsLine		Comment
HiLink cvsDir		cvsFile
HiLink cvsFile		Constant
HiLink cvsFiles		cvsCom
HiLink cvsTag		cvsCom
HiLink cvsCom		Statement

delcommand HiLink

let b:current_syntax = "cvs"
