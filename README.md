# rake_all_db_helper
Simple interactive rake task to automatically drop/migrate/drop &amp; migrate test and development databases

## Installation
Simply add the rake file to one of the following locations:

1. Your project's lib/tasks/ directory
2. Your ActiveRecord gem location (found using _rake -W db:drop_)

## Usage
Simply run this rake task as you would any other rake task, from your rails project directory, using the _alldb:_ prefix.
i.e.

To drop all Test & Development databases:

```rake alldb:drop```

To migrate all Test & Development databases:

```rake alldb:migrate```

To drop and migrate all Test & Development databases:

```rake alldb:redo```

## Things to keep in mind
1. The value specified by ```RAILS_ENV``` is ignored entirely. 
2. The environments that are affected are currently defined in the top of the rake file. This should be re-structured (see To Do item 1, below)

## To Do
1. Add the ability to specify rails environments prior to user execution, without setting the RAILS_ENV variable.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
