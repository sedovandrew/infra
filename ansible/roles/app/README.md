Role app
========

Configure Monolith Reddit application

Role Variables
--------------

    db_host - database IP address (default: 127.0.0.1)

Example Playbook
----------------

    - hosts: app
      become: true
      roles:
         - { role: app, db_host: 127.0.0.1 }

License
-------

BSD

Author Information
------------------

Sedov Andrey
