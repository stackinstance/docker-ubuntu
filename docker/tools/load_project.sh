composer install
php app/console doctrine:database:drop --force
php app/console doctrine:database:create --no-interaction
php app/console doctrine:migrations:migrate --no-interaction
php app/console doc:fixtures:load --no-interaction

php app/console assets:install --symlink
php app/console assetic:dump
