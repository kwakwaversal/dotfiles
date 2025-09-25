# Sqitch Templates

This project provides custom templates for Sqitch, using Template Toolkit.

The main file is `templates/deploy/pg.tmpl`, which defines how PostgreSQL
deploy scripts are generated. The use the EnvHash plugin to read Environment
variables.

```tt2
[%- USE env = EnvHash -%]
```

## Install required Perl modules

Install Template Toolkit and the EnvHash plugin via `cpanm`:

```bash
cpanm Template
cpanm Template::Plugin::EnvHash
```

(Verify if you like:)

```bash
perl -MTemplate -MTemplate::Plugin::EnvHash -e1
```

## Environment variable

The template reads `SQITCH_DEFAULT_SCHEMA` from your environment.
Persist it in `~/.profile.local`:

```bash
echo 'export SQITCH_DEFAULT_SCHEMA=public' >> ~/.profile.local
source ~/.profile.local
```

## Usage

Generate a change; Sqitch will render from `templates/deploy/pg.tmpl`:

```bash
sqitch add add_users_table -n "Add users table"
```
