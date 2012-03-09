import QtQuick 1.1

BaseTaskModel {
    id: tListModel

    Component.onCompleted: init()

    function init() {
        var db = getDb();
        db.transaction(
            function(tx) {
                // Create the tasklist table if it doesn't already exist
                // If the table exists, this is skipped
                tx.executeSql("CREATE TABLE IF NOT EXISTS tasklist(pos INT, name TEXT UNIQUE, point INT, done TINYINT)");
        });
        fetch();
    }

    function set(id, pos, name, point) {
        var db = getDb();
        var res = "";
        db.transaction(
           function(tx) {
                        id = typeof id === 'undefined' ? -1 : id;
                        var rs = tx.executeSql('SELECT rowid FROM tasklist WHERE rowid=?', [id]);
                        if (rs.rows.length > 0)
                            tx.executeSql('UPDATE tasklist SET pos=?, name=?, point=? WHERE rowid=?', [pos, name, point, id]);
                        else tx.executeSql('INSERT INTO tasklist VALUES (?,?,?,0);', [pos,name,point]);
           }
        );
    }

    function fetch() {
        var db = getDb();
        var res="";
        db.transaction(function(tx) {
                           var rs = tx.executeSql('SELECT rowid,* FROM tasklist ORDER BY pos');
                           if (rs.rows.length > 0) {
                               for (var i=0; i<rs.rows.length; i++) {
                                   tListModel.append({  "id": rs.rows.item(i).rowid,
                                                         "name": rs.rows.item(i).name,
                                                         "point": rs.rows.item(i).point});
                               }
                               res = "Ok";
                           } else {
                               res = "Unknown";
                           }
                       });
        return res
    }

    function save(delList) {
        var db = getDb();

        for (var j=0; j<delList.count; j++) {
            db.transaction(function(tx) {
                                   tx.executeSql('DELETE FROM tasklist WHERE rowid=?;', [delList.get(j).id]);
                           });
                }

        for (var i=0; i<tListModel.count; i++) {
            set(tListModel.get(i).id, i, tListModel.get(i).name, tListModel.get(i).point);
        }
    }
}
