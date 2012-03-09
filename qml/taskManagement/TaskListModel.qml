import QtQuick 1.1

ListModel {
    id: tListModel

    Component.onCompleted: init()

    function getDb() {
        return openDatabaseSync("GupaaTL", 1.0, "The list of tasks in Gupaa", 100000);
    }

    function init() {
        var db = getDb();
        db.transaction(
            function(tx) {
                // Create the tasklist table if it doesn't already exist
                // If the table exists, this is skipped
                tx.executeSql("CREATE TABLE IF NOT EXISTS tasklist(name TEXT UNIQUE, point INT, done TINYINT)");
        });
        fetch();
    }

    function set(name, point) {
        var db = getDb();
        var res = "";
        db.transaction(
           function(tx) {
                        var rs;
                        rs = tx.executeSql('SELECT name FROM tasklist WHERE name=?', [name]);
                        if (rs.rows.length > 0)
                            tx.executeSql('UPDATE tasklist SET point=? WHERE name=?', [point, name]);
                        else tx.executeSql('INSERT INTO tasklist VALUES (?,?,0);', [name,point]);
           }
        );
    }

    function fetch() {
        var db = getDb();
        var res="";
        db.transaction(function(tx) {
                           var rs = tx.executeSql('SELECT * FROM tasklist;');
                           if (rs.rows.length > 0) {
                               for (var i=0; i<rs.rows.length; i++) {
                                   tListModel.append({"name": rs.rows.item(i).name,
                                                         "point": rs.rows.item(i).point});
                               }
                               res = "Ok";
                           } else {
                               res = "Unknown";
                           }
                       });
        return res
    }

    function del(name) {
        var db = getDb();
        var res="";
        db.transaction(function(tx) {
                           var rs = tx.executeSql('DELETE FROM tasklist WHERE name=?;', [name]);
                       });
    }

    function save(delList) {
        for (var i=0; i<delList.length; i++) {
            del(delList[i])
        }

        for (var i=0; i<tListModel.count; i++) {
            set(tListModel.get(i).name, tListModel.get(i).point);
        }
    }
}
