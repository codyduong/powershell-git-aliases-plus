from thefuck.types import Command
from thefuck.rules import (
    git_add,
    git_add_force,
    git_bisect_usage,
    # git_branch_0flag, parsing error
    git_branch_delete,
    git_branch_delete_checked_out,
    git_branch_exists,
    git_branch_list,
    git_checkout,
    # git_clone_git_clone, <-- import not found?
    # git_clone_missing, <-- import not found?
    # git_commit_add,
    git_commit_amend,
    git_commit_reset,
    # git_diff_no_index,
    # git_diff_staged,
    # git_fix_stash,
    # git_flag_after_filename,
    # git_help_aliased,
    # git_hook_bypass,
    # git_lfs_mistype,
    # git_main_master,
    git_merge,
    git_merge_unrelated,
    # git_not_command,
    git_pull,
    git_pull_clone,
    git_pull_uncommitted_changes,
    git_push,
    git_push_different_branch_names,
    git_push_force,
    git_push_pull,
    git_push_without_commits,
    git_rebase_merge_dir,
    git_rebase_no_changes,
    # git_remote_delete,
    # git_remote_seturl_add,
    git_rm_local_modifications,
    git_rm_recursive,
    git_rm_staged,
    git_stash,
    git_stash_pop,
    # git_tag_force,
    # git_two_dashes,
)


def generate_rule(*argv):
    return [[arg.match, arg.get_new_command] for arg in argv]


ALIAS_LIST_RULES = {
    "add": generate_rule(git_add, git_add_force),
    "bisect": generate_rule(git_bisect_usage),
    "branch": generate_rule(
        # git_branch_0flag,
        git_branch_delete,
        git_branch_delete_checked_out,
        git_branch_exists,
        git_branch_list,
    ),
    "checkout": generate_rule(git_checkout),
    "clone": [],
    # "clone": generate_rule(git_clone_git_clone, git_clone_missing),
    "commit": generate_rule(
        # git_commit_add,
        git_commit_amend,
        git_commit_reset,
    ),
    "diff": [],
    "fix": [],
    "flag": [],
    "help": [],
    "hook": [],
    "lfs": [],
    "main_master": [],
    "merge": generate_rule(git_merge, git_merge_unrelated),
    "pull": generate_rule(
        git_pull,
        git_pull_clone,
        git_pull_uncommitted_changes,
    ),
    "push": generate_rule(
        git_push,
        git_push_different_branch_names,
        git_push_force,
        git_push_pull,
        git_push_without_commits,
    ),
    "rebase": generate_rule(git_rebase_merge_dir, git_rebase_no_changes),
    "remote": [],
    "rm": generate_rule(git_rm_local_modifications, git_rm_recursive, git_rm_staged),
    "stash": generate_rule(git_stash, git_stash_pop),
    "tag": [],
}


ALIAS_LIST = {
    "ga": ["git add", ALIAS_LIST_RULES["add"]],
    "gaa": ["git add --all", ALIAS_LIST_RULES["add"]],
    "gapa": ["git add --patch", ALIAS_LIST_RULES["add"]],
    "gau": ["git add --update", ALIAS_LIST_RULES["add"]],
    "gav": ["git add --verbose", ALIAS_LIST_RULES["add"]],
    "gb": ["git branch", ALIAS_LIST_RULES["branch"]],
    "gba": ["git branch --all", ALIAS_LIST_RULES["branch"]],
    "gbd": ["git branch --delete", ALIAS_LIST_RULES["branch"]],
    "gbD": ["git branch --delete --force", ALIAS_LIST_RULES["branch"]],
    # "gbg": ["git branch -vv", ALIAS_LIST_RULES['branch']],
    "gbnm": ["git branch --no-merged", ALIAS_LIST_RULES["branch"]],
    "gbr": ["git branch --remote", ALIAS_LIST_RULES["branch"]],
    # "ggsup": ["git branch --set-upstream-to=origin/$(git_current_branch)", ALIAS_LIST_RULES["branch"]],
    "gcb": ["git checkout -b ", ALIAS_LIST_RULES["checkout"]],
    "gcm": ["git checkout $(git_main_branch)", ALIAS_LIST_RULES["checkout"]],
    "gcd": ["git checkout $(git_develop_branch)", ALIAS_LIST_RULES["checkout"]],
    "gco": ["git checkout", ALIAS_LIST_RULES["checkout"]],
    "gcor": ["git checkout --recurse-submodules", ALIAS_LIST_RULES["checkout"]],
    "gcl": ["git clone --recurse-submodules", ALIAS_LIST_RULES["clone"]],
    "gc": ["git commit --verbose", ALIAS_LIST_RULES["commit"]],
    "gc!": ["git commit --verbose --amend", ALIAS_LIST_RULES["commit"]],
    "gcn!": ["git commit --verbose --no-edit --amend", ALIAS_LIST_RULES["commit"]],
    "gca": ["git commit --verbose --all", ALIAS_LIST_RULES["commit"]],
    "gca!": ["git commit --verbose --all --amend", ALIAS_LIST_RULES["commit"]],
    "gcan!": [
        "git commit --verbose --all --no-edit --amend",
        ALIAS_LIST_RULES["commit"],
    ],
    "gcans!": [
        "git commit --verbose --all --signoff --no-edit --amend",
        ALIAS_LIST_RULES["commit"],
    ],
    "gcam": ["git commit --all --message", ALIAS_LIST_RULES["commit"]],
    "gcas": ["git commit --all --signoff", ALIAS_LIST_RULES["commit"]],
    "gcasm": ["git commit --all --signoff --message", ALIAS_LIST_RULES["commit"]],
    "gcsm": ["git commit --signoff --message", ALIAS_LIST_RULES["commit"]],
    "gcmsg": ["git commit --message", ALIAS_LIST_RULES["commit"]],
    "gcs": ["git commit -S", ALIAS_LIST_RULES["commit"]],
    "gcss": ["git commit -S -s", ALIAS_LIST_RULES["commit"]],
    "gcssm": ["git commit -S -s -m", ALIAS_LIST_RULES["commit"]],
    "gm": ["git merge", ALIAS_LIST_RULES["merge"]],
    # "gmom": ["git merge origin/$(git_main_branch)", ALIAS_LIST_RULES["merge"]],
    "gmtl": ["git mergetool --no-prompt", ALIAS_LIST_RULES["merge"]],
    "gmtlvim": ["git mergetool --no-prompt --tool=vimdiff", ALIAS_LIST_RULES["merge"]],
    # "gmum": ["git merge upstream/$(git_main_branch)", ALIAS_LIST_RULES["merge"]],
    "gma": ["git merge --abort", ALIAS_LIST_RULES["merge"]],
    "gup": ["git pull --rebase", ALIAS_LIST_RULES["pull"]],
    "gupv": ["git pull --rebase --verbose", ALIAS_LIST_RULES["pull"]],
    "gupa": ["git pull --rebase --autostash", ALIAS_LIST_RULES["pull"]],
    "gupav": ["git pull --rebase --autostash --verbose", ALIAS_LIST_RULES["pull"]],
    "gp": ["git push", ALIAS_LIST_RULES["push"]],
    "gpd": ["git push --dry-run", ALIAS_LIST_RULES["push"]],
    # TODO gpf has two different aliases depending on git version
    "gpf": ["git push --force-with-lease", ALIAS_LIST_RULES["push"]],
    "gpf!": ["git push --force", ALIAS_LIST_RULES["push"]],
    "gpoat": [
        "git push origin --all && git push origin --tags",
        ALIAS_LIST_RULES["push"],
    ],
    # "gupom": ["git pull --rebase origin $git_main_branch)", ALIAS_LIST_RULES["pull"]],
    # "gupomi": ["git pull --rebase=interactive origin $(git_main_branch)", ALIAS_LIST_RULES["pull"]],
    # "glum": ["git pull upstream $(git_main_branch)", ALIAS_LIST_RULES["pull"]],
    # "gluc": ["git pull upstream $(git_current_branch)", ALIAS_LIST_RULES["pull"]],
    "gpod": ["git push origin delete", ALIAS_LIST_RULES["push"]],
    "gpu": ["git push upstream", ALIAS_LIST_RULES["push"]],
    "gpv": ["git push --verbose", ALIAS_LIST_RULES["push"]],
    "grb": ["git rebase", ALIAS_LIST_RULES["rebase"]],
    "grba": ["git rebase --abort", ALIAS_LIST_RULES["rebase"]],
    "grbc": ["git rebase --continue", ALIAS_LIST_RULES["rebase"]],
    # "grbd": ["git rebase $(git_develop_branch)", ALIAS_LIST_RULES["rebase"]],
    "grbi": ["git rebase --interactive", ALIAS_LIST_RULES["rebase"]],
    # "grbm": ["git rebase $(git_main_branch)", ALIAS_LIST_RULES["rebase"]],
    # "grbom": ["git rebase origin/$(git_main_branch)", ALIAS_LIST_RULES["rebase"]],
    "grbo": ["git rebase --onto", ALIAS_LIST_RULES["rebase"]],
    "grbs": ["git rebase --skip", ALIAS_LIST_RULES["rebase"]],
    "grm": ["git rm", ALIAS_LIST_RULES["rm"]],
    "grmc": ["git rm --cached", ALIAS_LIST_RULES["rm"]],
    "gsta": ["git stash save", ALIAS_LIST_RULES["stash"]],
    "gstaa": ["git stash apply", ALIAS_LIST_RULES["stash"]],
    "gstc": ["git stash clear", ALIAS_LIST_RULES["stash"]],
    "gstd": ["git stash drop", ALIAS_LIST_RULES["stash"]],
    "gstl": ["git stash list", ALIAS_LIST_RULES["stash"]],
    "gstp": ["git stash pop", ALIAS_LIST_RULES["stash"]],
    "gsts": ["git stash show --text", ALIAS_LIST_RULES["stash"]],
    "gstu": ["git stash --include-untracked", ALIAS_LIST_RULES["stash"]],
    "gstall": ["git stash --all", ALIAS_LIST_RULES["stash"]],
}


def _generate_unalias_command(command):
    global git_alias_corrections

    # replace the corrected value
    if len(git_alias_corrections) == 0:
        new_command_parts = []
        rules = None
        for part in command.script_parts:
            if part in ALIAS_LIST.keys():
                new_command_parts.append(ALIAS_LIST[part][0])
                rules = ALIAS_LIST[part][1]
            else:
                new_command_parts += part
        new_command = Command.from_raw_script(new_command_parts)
        # go through other rule matches and get_new_command
        for rule in rules:
            if rule[0](new_command):
                continue
            unaliased_fixed_command = rule[1](new_command)
            # TODO put back the alias if possible
            if type(unaliased_fixed_command) is list:
                git_alias_corrections.extend(unaliased_fixed_command)
            else:
                git_alias_corrections.append(unaliased_fixed_command)

    return git_alias_corrections


def match(command):
    global git_alias_corrections
    git_alias_corrections = []
    return len(_generate_unalias_command(command)) > 0


def get_new_command(command):
    return _generate_unalias_command(command)
