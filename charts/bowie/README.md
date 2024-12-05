# Bowie Helm-Chart

Bowie Chart is a "meta-chart".
You can use it if you just want all services provided by bowie (All tools for design questionnaires).

Bowie-Chart depends on the following Chart:

- [ui-api-db](../ui-api-db/): Generic Chart for UI (React app), API (SpringBoot app) and DB (PostgreSQL from the chart proposed by Bitami)
- [eno-ws](../eno-ws/): Chart which describes generation module
- [orbeon-existdb](../orbeon-existdb/): Chart which provides form visualisation based on XML.

## How to use it ?

There are many environment values to write to run all tools for design questionnaire (12 modules + 3 PostgreSQL Databases).
This Chart helps you to use it.
