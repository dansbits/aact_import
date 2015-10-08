# aact_import
This repository provides a set of scripts for importing the Aggregate Analysis of ClincalTrials.gov 
provided by the Clinical Trial Transformation Initiative. This includes data on all studies listed on 
ClinicalTrials.gov. More information can be found 
[here](http://www.ctti-clinicaltrials.org/what-we-do/analysis-dissemination/state-clinical-trials/aact-database).

*This code does not yet import the results tables in the aact dataset.*

## Prerequisites
1. Ruby
2. Rubygems
3. The sequel and activesupport gems. Install using the commands below.

```
gem install sequel
gem install activesupport
```

# Usage

## 1. Get the data
The data can be obtained [here](http://www.ctti-clinicaltrials.org/what-we-do/analysis-dissemination/state-clinical-trials/aact-database).

Be sure to download the pipe delimited text output. Once downloaded, extract the contents into a directory
named 'data' inside the aact_import directory.

## 2. Configure the database parameters
Make a copy of the database.yml.tpl file, naming it database.yml. Then edit the file with your relevant details. This can
use any adapter supported by the ruby sequel gem [[docs](https://github.com/jeremyevans/sequel)]. Below is an example for
a postgres databse connection.

```
adapter:  postgres
host:     localhost
database: aact
user:     my_db_user
password: my_db_pass
```

## 3. Create the database schema
In the aact_import directory, run the following from the console.
```
ruby create_schema.rb
```

## 4. Import the data
*This takes a very long time.*
```
ruby import_data.rb
```

## Need additional help?
If anything is confusing or just not working either create an [issue](https://github.com/dansbits/aact_import/issues) or feel free to
make changes and create a pull request. Contributions are welcome.
