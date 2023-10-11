require 'gitti/backup'


reposet = GitRepoSet.read( './repos.yml' )
#=>  560 repo(s) @ 72 org(s)
#=>  556 repo(s) @ 69 org(s)  - on Oct/11 2023

backup = GitBackup.new( '/backup2023' )
backup.backup( reposet )

puts "bye"

