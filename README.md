# mochi
*APIs* https://docs.google.com/document/d/1VoM0TwMLl4gp4GrJ0Iybu_0Yk-NCR-FEd5O43I3oU8E/edit?usp=sharing

*ERD* https://lucid.app/lucidchart/7a10d9ea-068b-40a0-baeb-103d69dded62/edit?invitationId=inv_05593ddb-2256-44ad-a7f3-b8720dc108bc&referringApp=slack&page=C2mnikLfn_nJ#

## Onboarding#
### Mac Users:#
1. install postgres via brew
```
brew install postgres
```
2. Download postgres client [here](https://postgresapp.com/). To view the tables with UI, download [Postico](https://eggerapps.at/postico/).
3. Open your postgres app, start a local postgres server. Click on ** server settings... ** and change the port number to ** 3142 **. Open preference and set ** Open database with ** option to Postico.
4. install python packages (peewee, flask, psycopg2, and any other packages our program requires) via pip.
Example command:

```
pip3 install peewee
```
5. run
```
cd backend
python3 dbsetup.py
```
and check the postgres client, click on the database icon labeled with ** Postgres **, a Postico window should pop up and show you all the tables.