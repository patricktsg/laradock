#!/bin/sh

phpmd() {
    docker-compose run workspace ./vendor/bin/phpmd app html ./phpmd-ruleset.xml --reportfile resources/views/insights/phpmd.blade.php --ignore-violations-on-exit
    # TODO: Check pacakges
}

pdepend() {
    docker-compose run workspace ./vendor/bin/pdepend --summary-xml=summary.xml --jdepend-chart=public/img/jdepend.svg --overview-pyramid=public/img/pyramid.svg app
    # TODO: Check pacakges
}

psr() {
    docker-compose run workspace ./vendor/bin/php-cs-fixer fix --config=.php_cs.dist -v --using-cache=no
}

$1
