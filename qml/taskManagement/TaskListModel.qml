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
                tx.executeSql("CREATE TABLE IF NOT EXISTS tasklist(id INT PRIMARY KEY, name TEXT UNIQUE, point INT)");
        });
        fetch();
    }

    function set(name, point) {
        var db = getDb();
        var res = "";
        db.transaction(function(tx) {
               var rs = tx.executeSql('INSERT OR REPLACE INTO tasklist VALUES (?,?);', [name,point]);
               //console.log(rs.rowsAffected)
               if (rs.rowsAffected > 0) {
                   res = "OK";
               } else {
                   res = "Error";
               }
           }
        );
        // The function returns “OK” if it was successful, or “Error” if it wasn't
        return res;
    }

    function fetch() {
        var db = getDb();
        var res="";
        db.transaction(function(tx) {
                           var rs = tx.executeSql('SELECT * FROM tasklist;');
                           if (rs.rows.length > 0) {
                               for (var i=0; i<rs.rows.length; i++) {
                                   tListModel.append({name: rs.rows.item(i).name,
                                                         point: rs.rows.item(i).point});
                               }
                               res = "Ok";
                           } else {
                               res = "Unknown";
                           }
                       })
        return res
    }
}
