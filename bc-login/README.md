# Table of Content

<!-- vim-markdown-toc GFM -->

- [Working](#working)
- [Issues](#issues)
- [ToDo](#todo)

<!-- vim-markdown-toc -->
# Working
  - puppet configuration for
    - docker daemon
    - docker-compose
    - running docker-compose on service
    - automated service via docker compose
   - Populate Databases
    - Initialise DB (initdb)
    - Change guacadmin pwd & force new password
    - Initialise service struct
    - Create User
    - Create user specific connections
    - Map user to connection groups/connections
  - Nginx ReverseProxy

# Issues
  - exploring REST api aside from /api/tokens

  - Hardend ssh config prevents guacamole ssh (HMAC and KEX are problematic)

# ToDo
  - Make puppet template files from sql statements
