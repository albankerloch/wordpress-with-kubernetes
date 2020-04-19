#!/bin/sh

mysql -u root -e 'CREATE DATABASE wordpress;'

mysql wordpress -u root < wordpress.sql 
