Role db
=======

Configuration MongoDB

Role Variables
--------------

    mongo_port    - port for MongoDB (default: 27017)
    mongo_bind_ip - IP address       (default: 127.0.0.1)

Example Playbook
----------------

    - hosts: db
      become: true
      roles:
         - { role: db, mongo_bind_ip: 0.0.0.0, mongo_port: 27017 }

License
-------

BSD

Author Information
------------------

Sedov Andrey
