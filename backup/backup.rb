require 'gitti/backup'


reposet = GitRepoSet.read( './repos.yml' )
#=>  560 repo(s) @ 72 org(s)

backup = GitBackup.new( '/backup2023' )
backup.backup( reposet )

puts "bye"

