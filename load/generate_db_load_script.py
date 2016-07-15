
import sys
import glob
import os
import shutil

def main(database_name, rrf_directory, user_name, password, path_to_psql="/usr/bin/psql", script_extension="bat",
         host_name="localhost", rxnorm="rxnorm"):

    rrf_files = glob.glob(os.path.join(rrf_directory, "*.RRF"))
    shutil.copyfile(rxnorm + "_create_indices.sql", os.path.join(rrf_directory, "create_indices.sql"))
    shutil.copyfile(rxnorm + "_create_tables.sql", os.path.join(rrf_directory, "create_tables.sql"))
    base_psql_cmd = '"%s" --username=%s --host=%s %s' % (path_to_psql, user_name, host_name, database_name)

    with open(os.path.join(rrf_directory, "load_tables.sql"), "w") as fw:
        for rrf_file in rrf_files:
            directory, rf = os.path.split(rrf_file)
            table_name, _ = os.path.splitext(rf)
            table_name = table_name.lower()

            fw.write("copy %s.%s from '%s' with (delimiter '|', null '');" % (rxnorm, table_name, rrf_file))
            fw.write("\n")

    with open(os.path.join(rrf_directory, "post_processing.sql"), "w") as fw:
        for rrf_file in rrf_files:
            directory, rf = os.path.split(rrf_file)
            table_name, _ = os.path.splitext(rf)
            table_name = table_name.lower()
            fw.write("alter table %s.%s drop column t;\n" % (rxnorm, table_name))

    with open(os.path.join(rrf_directory, "load_db" + "." + script_extension), "w") as fw:
        fw.write('set PGPASSWORD=%s' % password)
        fw.write("\n")
        fw.write("%s < create_tables.sql" % base_psql_cmd)
        fw.write("\n")
        fw.write("%s < load_tables.sql" % base_psql_cmd)
        fw.write("\n")
        fw.write("%s < post_processing.sql" % base_psql_cmd)
        fw.write("\n")
        fw.write("%s < create_indices.sql" % base_psql_cmd)
        fw.write("\n")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5])