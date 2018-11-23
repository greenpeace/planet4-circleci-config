set -eu

# export SITE=koyansync

all_sites=( \
    koyansync \
    koyantestdash \
    )

for SITE in "${all_sites[@]}"
do
    git clone https://github.com/greenpeace/planet4-${SITE} --quiet
    # cd planet4-${SITE}/.circleci
    if [ -f planet4-${SITE}/.circleci/artifacts.yml ]
    then
        cat header.yml planet4-${SITE}/.circleci/artifacts.yml config-jw-template.yml > planet4-${SITE}/.circleci/config.yml

        if ! git -C "planet4-${SITE}" diff --quiet
        then
            git -C "planet4-${SITE}" commit -m "Updated circleCI configuration" .circleci/config.yml
            git -C "planet4-${SITE}" push
            echo "planet4-${SITE} - Generated and pushed new configuration"
        else
            echo "planet4-${SITE} - No changes needed"
        fi
    else
        echo "planet4-${SITE} - DOES NOT have an artifacts file. Cannot generate new configuration"
    fi

    rm -rf planet4-${SITE}
done
