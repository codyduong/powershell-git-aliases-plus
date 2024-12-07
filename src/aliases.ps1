. $PSScriptRoot\utils.ps1

# Prevent conflict with built-in aliases
Remove-Alias gc -Force -ErrorAction SilentlyContinue
Remove-Alias gcb -Force -ErrorAction SilentlyContinue
Remove-Alias gcm -Force -ErrorAction SilentlyContinue
Remove-Alias gcs -Force -ErrorAction SilentlyContinue
Remove-Alias gl -Force -ErrorAction SilentlyContinue
Remove-Alias gm -Force -ErrorAction SilentlyContinue
Remove-Alias gp -Force -ErrorAction SilentlyContinue
Remove-Alias gpv -Force -ErrorAction SilentlyContinue

function g {
	git $args
}



function ga {
	git add $args
}
function gaa {
	git add --all $args
}
function gapa {
	git add --patch $args
}
function gau {
	git add --update $args
}
function gav {
	git add --verbose $args
}
function gap {
	git apply $args
}
function gapt {
	git apply --3way $args
}



function gb {
	git branch $args
}
function gba {
	git branch --all $args
}
function gbd {
	git branch --delete $args
}
function gbd {
	git branch -d $args
}
function gbda {
	$MainBranch = Get-Git-MainBranch
	$MergedBranchs = $(git branch --merged | Select-String "^(\*|\s*($MainBranch|develop|dev)\s*$)" -NotMatch).Line
	$MergedBranchs | ForEach-Object {
		if ([string]::IsNullOrEmpty($_)) {
			return
		}
		git branch -d $_.Trim()
	}
}
function gbD {
	git branch --delete --force $args
}
# TODO gbg 'git branch -vv | grep ": gone\]"'
# TODO gbgd 'local res=$(gbg | awk '"'"'{print $1}'"'"') && [[ $res ]] && echo $res | xargs git branch -d'
# TODO gbgD 'local res=$(gbg | awk '"'"'{print $1}'"'"') && [[ $res ]] && echo $res | xargs git branch -D'
function gbl {
	git blame -b -w $args
}
function gbnm {
	git branch --no-merged $args
}
function gbr {
	git branch --remote $args
}
function gbs {
	git bisect $args
}
function gbsb {
	git bisect bad $args
}
function gbsg {
	git bisect good $args
}
function gbsr {
	git bisect reset $args
}
function gbss {
	git bisect start $args
}



function gc {
	git commit -v $args
}
function gc! {
	git commit -v --amend $args
}
function gcn! {
	git commit -v --no-edit --amend $args
}
function gca {
	git commit -v -a $args
}
function gca! {
	git commit -v -a --amend $args
}
function gcan! {
	git commit -v -a --no-edit --amend $args
}
function gcans! {
	git commit -v -a -s --no-edit --amend $args
}
function gcam {
	git commit -a -m $args
}
function gcsm {
	git commit --signoff --message $args
}
function gcas {
	git commit -a --signoff $args
}
function gcasm {
	git commit --all --signoff --message $args
}
function gcb {
	git checkout -b $args
}
function gcf {
	git config --list $args
}



# TODO gccd



function gcl {
	git clone --recursive $args
}
function gclean {
	git clean -df $args
}
function gpristine {
	git reset --hard
	git clean -dfx
}
function gcm {
	$MainBranch = Get-Git-MainBranch

	git checkout $MainBranch $args
}
function gcd {
	git checkout develop $args
}
function gcmsg {
	git commit -m $args
}
function gco {
	git checkout $args
}
function gcor {
	git checkout --recurse-submodules $args
}
function gcount {
	git shortlog -sn $args
}
function gcp {
	git cherry-pick $args
}
function gcpa {
	git cherry-pick --abort $args
}
function gcpc {
	git cherry-pick --continue $args
}
function gcs {
	git commit -S $args
}
function gcss {
	git commit --gpg-sign --signoff $args
}
function gcssm {
	git commit --gpg-sign --signoff --message $args
}



function gd {
	git diff $args
}
function gdca {
	git diff --cached $args
}
function gdcw {
	git diff --cached --word-diff $args
}
# todo gdct 'git describe --tags $(git rev-list --tags --max-count=1)'
function gds {
	git diff --staged $args
}
function gdt {
	git diff-tree --no-commit-id --name-only -r $args
}
# todo gdup 'git diff @{upstream}'
function gdw {
	git diff --word-diff $args
}



# todo gdnolock
# todo gdv



function gf {
	git fetch $args
}
function gfa {
	if ([semver](Get-GitSemVer) -ge [semver]"2.8") {
		git fetch --all --tags --prune --jobs=10 $args
	} else {
		git fetch --all --tags --prune $args
	}
}
function gfo {
	git fetch origin $args
}



# todo gfg 'git ls-files | grep'



function gg {
	git gui citool $args
}
function gga {
	git gui citool --amend $args
}
function ggf {
	$CurrentBranch = Get-Git-CurrentBranch

	git push --force origin $CurrentBranch
}
function ggfl {
	$CurrentBranch = Get-Git-CurrentBranch

	git push --force-with-lease origin $CurrentBranch
}
function ggl {
	$CurrentBranch = Get-Git-CurrentBranch

	git pull origin $CurrentBranch
}
function ggp {
	$CurrentBranch = Get-Git-CurrentBranch

	git push origin $CurrentBranch
}
# todo ggpnp
# todo ggu
function ggsup {
	$CurrentBranch = Get-Git-CurrentBranch

	git branch --set-upstream-to=origin/$CurrentBranch
}
function gpsup {
	$CurrentBranch = Get-Git-CurrentBranch

	git push --set-upstream origin $CurrentBranch
}



function ghh {
	git help $args
}



function gignore {
	git update-index --assume-unchanged $args
}
function gignored {
	git ls-files -v | Select-String "^[a-z]" -CaseSensitive
}
# todo git-svn-dcommit-push



function gl {
	git pull $args
}
function glg {
	git log --stat --color $args
}
function glgp {
	git log --stat --patch $args
}
function glgg {
	git log --graph --color $args
}
function glgga {
	git log --graph --decorate --all $args
}
function glgm {
	git log --graph --max-count=10 $args
}
function glo {
	git log --oneline --decorate --color $args
}
function glol {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $args
}
# todo glols
# todo glod
# todo glods
function glola {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all $args
}
function glog {
	git log --oneline --decorate --color --graph $args
}
function gloga {
	git log --oneline --decorate --color --graph --all $args
}
# todo glp



function gm {
	git merge $args
}
function gmom {
	$MainBranch = Get-Git-MainBranch

	git merge origin/$MainBranch $args
}
function gmtl {
	git mergetool --no-prompt $args
}
function gmtlvim {
	git mergetool --no-prompt --tool=vimdiff $args
}
function gmum {
	$MainBranch = Get-Git-MainBranch

	git merge upstream/$MainBranch $args
}
function gma {
	git merge --abort
}



function gp {
	git push $args
}
function gpd {
	git push --dry-run $args
}
function gpf {
	# todo --force-if-includes
	git push --force-with-lease $args
}
function gpf! {
	git push --force $args
}
function gpoat {
	git push origin --all
	git push origin --tags
}
function gpod {
	git push origin --delete $args
}
function gpr {
	git pull --rebase $args
}
function gpu {
	git push upstream $args
}
function gpv {
	git push -v $args
}



function gr {
	git remote $args
}
function gra {
	git remote add $args
}
function grb {
	git rebase $args
}
function grba {
	git rebase --abort $args
}
function grbc {
	git rebase --continue $args
}
# todo grbd 'git rebase $(git_develop_branch)'
function grbi {
	git rebase -i $args
}
function grbm {
	$MainBranch = Get-Git-MainBranch

	git rebase $MainBranch $args
}
function grbom {
	$MainBranch = Get-Git-MainBranch

	git rebase origin/$MainBranch $args
}
function grbo {
	git rebase --onto $args
}
function grbs {
	git rebase --skip $args
}
function grev {
	git revert
}
function grh {
	git reset $args
}
function grhh {
	git reset --hard $args
}
function groh {
	$CurrentBranch = Get-Git-CurrentBranch

	git reset origin/$CurrentBranch --hard $args
}
function grm {
	git rm $args
}
function grmc {
	git rm --cached $args
}
function grmv {
	git remote rename $args
}
function grrm {
	git remote remove $args
}
function grs {
	git restore $args
}
function grst {
	git restore --staged $args
}
function grset {
	git remote set-url $args
}
function grss {
	git restore --source $args
}
function grst {
	git restore --staged $args
}
function grt {
	try {
		$RootPath = git rev-parse --show-toplevel
	}
	catch {
		$RootPath = "."
	}
	Set-Location $RootPath
}
function gru {
	git reset -- $args
}
function grup {
	git remote update $args
}
function grv {
	git remote -v $args
}



function gsb {
	git status -sb $args
}
function gsd {
	git svn dcommit $args
}
function gsh {
	git show $args
}
function gsi {
	git submodule init $args
}
function gsps {
	git show --pretty=short --show-signature $args
}
function gsr {
	git svn rebase $args
}
function gss {
	git status -s $args
}
function gst {
	git status $args
}



function gsta {
	if ([semver](Get-GitSemVer) -ge [semver]"2.13") {
		git stash push $args
	} else {
		git stash save $args
	}
}



function gstaa {
	git stash apply $args
}
function gstc {
	git stash clear $args
}
function gstd {
	git stash drop $args
}
function gstl {
	git stash list $args
}
function gstp {
	git stash pop $args
}
function gsts {
	git stash show --text $args
}
function gstu {
	gsta --include-untracked $args
}
function gstall {
	git stash --all $args
}
function gsu {
	git submodule update $args
}
function gsw {
	git switch $args
}
function gswc {
	git switch --create $args
}
function gswm {
	$MainBranch = Get-Git-MainBranch

	git switch $MainBranch $args
}
# todo gswd 'git switch $(git_develop_branch)'



function gts {
	git tag -s $args
}
# todo gtv 'git tag | sort -V'
# todo gtl 'gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'



function gunignore {
	git update-index --no-assume-unchanged $args
}
function gunwip {
	Write-Output $(git log -n 1 | Select-String "--wip--" -Quiet).Count
	git reset HEAD~1
}
function gup {
	git pull --rebase $args
}
function gupa {
	git pull --rebase --autostash $args
}
function gupv {
	git pull --rebase -v $args
}
function gupa {
	git pull --rebase --autostash $args
}
function gupav {
	git pull --rebase --autostash --verbose $args
}
function gupom {
	$MainBranch = Get-Git-MainBranch

	git pull --rebase origin $MainBranch $args
}
function gupomi {
	$MainBranch = Get-Git-MainBranch

	git pull --rebase=interactive origin $MainBranch $args
}
function glum {
	$MainBranch = Get-Git-MainBranch

	git pull upstream $MainBranch $args
}
function gluc {
	$CurrentBranch = Get-Git-CurrentBranch

	git pull upstream $CurrentBranch $args
}



function gwch {
	git whatchanged -p --abbrev-commit --pretty=medium $args
}
function gwip {
	git add -A
	git rm $(git ls-files --deleted) 2> $null
	git commit --no-verify -m "--wip-- [skip ci]"
}



function gwt {
	git worktree $args
}
function gwta {
	git worktree add $args
}
function gwtls {
	git worktree list $args
}
function gwtmw {
	git worktree move $args
}
function gwtrm {
	git worktree remove $args
}



function gam {
	git am $args
}
function gamc {
	git am --continue $args
}
function gams {
	git am --skip $args
}
function gama {
	git am --abort $args
}
function gamscp {
	git am --show-current-patch $args
}



# todo grename
function ggpnp {
	ggl; ggp $args
}
function gprom {
	$MainBranch = Get-Git-MainBranch

	git pull --rebase origin $MainBranch $args
}
