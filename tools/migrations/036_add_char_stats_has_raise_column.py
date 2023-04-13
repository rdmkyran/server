import mariadb


def migration_name():
    return "Adding has_raise column to char_stats table"


def check_preconditions(cur):
    return


def needs_to_run(cur):
    # Ensure has_raise column exists in char_stats
    cur.execute("SHOW COLUMNS FROM char_stats LIKE 'has_raise'")
    if not cur.fetchone():
        return True
    return False


def migrate(cur, db):
    try:
        cur.execute(
            "ALTER TABLE `char_stats` \
        ADD COLUMN `has_raise` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `death`;"
        )
        db.commit()
    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
