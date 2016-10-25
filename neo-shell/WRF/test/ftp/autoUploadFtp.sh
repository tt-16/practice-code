#!/bin/bash
ftp -n<<!
	open 121.28.82.205
	user lmsfd lmsfd2012
	binary
	cd changning
	prompt
	put *WPD
	close
	bye
!
