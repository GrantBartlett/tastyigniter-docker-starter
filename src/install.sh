#!/bin/bash
composer create-project tastyigniter/tastyigniter ./tastyigniter --stability=beta
cd tastyigniter
php artisan igniter:install