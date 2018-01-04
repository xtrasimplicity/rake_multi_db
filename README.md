# rake_multi_db_helper
Simple interactive rake task to automatically drop/migrate/drop &amp; migrate/reset multiple databases

## Installation
1. Add `gem 'rake-multi-db', '~> 0.0'`to your application's Gemfile.
2. Add 'require 'rakei_multi_db' to the top of your `Rakefile`

## Usage
Simply run this rake task as you would any other rake task, from your rails project directory, using the _multi_db:_ prefix and the appropriate tasks and parameters.

### Parameters
The following parameters are able to be invoked

| Parameter        | Default Value           | Comment  | Example |
| ------------- |:-------------:| -----:|----------:|
| environments      | test,development | A comma-seperated string of environments to work with. | ```rake multi_db:drop environments=test,development```|
| force      | false      |  Whether to forcefully progress if an error occurs,<br /> without prompting the user. | ```rake multi_db:drop force=true``` |

The following tasks are able to be used

| Task | Purpose                                    |
|--------:|-------------------------------------------:|
| drop   | Drops the specified environment's database.|
| migrate| Migrates the specified environment's database from the relevant migration file.|
| redo   | Drops and migrates the specified environment's database.|
| reset  | Resets all table data for the specified environment.|

Arguments are passed as follows:
```rake multi_db:{Task} {parameter}={parameter_value}```

i.e. 

To drop specified environment databases:

```rake multi_db:drop environments={environments_to_drop_comma_seperated}```

To drop test and development databases:

```rake multi_db:drop``` or ```rake multi_db:drop environments=test,development```

To migrate all Test & Development databases:

```rake multi_db:migrate``` or ```rake multi_db:migrate environments=test,development```


To drop and migrate all Test & Development databases:

```rake multi_db:redo``` or ```rake multi_db:redo environments=test,development```

To reset all Test & Development databases

```rake multi_db:reset``` or ```rake multi_db:reset environments=test,development```


## Things to keep in mind
1. The value specified by ```RAILS_ENV``` is ignored entirely.
2. When no environments are passed through to this rake task, it will automatically use both ```test``` and ```development``` environments. 
i.e. running ```rake multi_db:drop``` will drop ***all*** ```test``` and ```development``` databases. If you only want to drop, say, the test databases, specify an environment, as follows: 
```rake multi_db:drop environments=test```

3. By default, when an error is encountered, the user will be asked to confirm whether they would like to continue. If you want to forcefully progress, and suppress all prompts, execute the rake task using the ```force``` parameter
i.e. ```rake multi_db:drop environments=test,development force=true```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
