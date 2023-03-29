@{

# Script module or binary module file associated with this manifest.
RootModule = 'git-aliases-plus.psm1'

# Version number of this module.
ModuleVersion = '0.1.0'

# ID used to uniquely identify this module
GUID = '4e36d89f-b9e8-43a3-b7b1-ddb0427d9e08'

# Author of this module
Author = 'Saran Tanpituckpong and Cody Duong'

# Copyright statement for this module
Copyright = '(c) Saran Tanpituckpong and Cody Duong. All rights reserved.'

# Description of the functionality provided by this module
Description = "A PowerShell module that provide partial Git aliases from Oh My Zsh's git plugin."

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

PrivateData = @{

	PSData = @{

		# Tags applied to this module. These help with module discovery in online galleries.
		Tags = @('git', 'alias', 'aliases', 'oh-my-zsh')

		# A URL to the license for this module.
		LicenseUri = 'https://github.com/codyduong/powershell-git-aliases-plus/blob/master/LICENSE'

		# A URL to the main website for this project.
		ProjectUri = 'https://github.com/codyduong/powershell-git-aliases-plus'
	}

}

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/codyduong/powershell-git-aliases-plus'
}

