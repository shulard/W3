DROP TABLE IF EXISTS awecode;

CREATE TABLE awecode (
    id          VARCHAR(255),
    title       VARCHAR(255),
    vimeoId     INTEGER,
    declare     LONGVARCHAR,
    description LONGVARCHAR,

    PRIMARY KEY(id)
);

INSERT INTO awecode ( id, title, vimeoId, declare, description ) VALUES (
    'console-readline',
    '<code>Hoa\Console\Readline</code>',
    66407773,
    '[{"id":"readline","name":"Console\/Readline.php","keyframes":[{"start":21,"end":77,"diff":"@@ -0,0 +1,5 @@\n+<?php\n+\n+require ''\/usr\/local\/lib\/Hoa\/Core\/Core.php'';\n+\n+echo fgets(STDIN);"},{"start":77,"end":173,"diff":"@@ -2,4 +2,14 @@\n \n require ''\/usr\/local\/lib\/Hoa\/Core\/Core.php'';\n \n-echo fgets(STDIN);\n+from(''Hoa'')\n+-> import(''Console.Readline.~'');\n+\n+$read = new Hoa\\Console\\Readline();\n+\n+do {\n+\n+    $line = $read->readLine(''> '');\n+    echo $line, \"\\n\";\n+}\n+while(false !== $line && ''quit'' !== $line);"},{"start":173,"end":231,"diff":"@@ -3,9 +3,18 @@\n require ''\/usr\/local\/lib\/Hoa\/Core\/Core.php'';\n \n from(''Hoa'')\n+-> import(''Console.Readline.Autocompleter.Word'')\n -> import(''Console.Readline.~'');\n \n $read = new Hoa\\Console\\Readline();\n+$read->setAutocompleter(new Hoa\\Console\\Readline\\Autocompleter\\Word(\n+    array(\n+        ''apple'',\n+        ''banana'', ''blackberry'', ''blueberry'',\n+        ''raspberry'',\n+        ''strawberry''\n+    )\n+));\n \n do {"},{"start":231,"end":343,"diff":"@@ -8,12 +8,7 @@ from(''Hoa'')\n \n $read = new Hoa\\Console\\Readline();\n $read->setAutocompleter(new Hoa\\Console\\Readline\\Autocompleter\\Word(\n-    array(\n-        ''apple'',\n-        ''banana'', ''blackberry'', ''blueberry'',\n-        ''raspberry'',\n-        ''strawberry''\n-    )\n+    get_defined_functions()[''internal'']\n ));\n \n do {"}]}]',
    '<p>Au sommaire : pourquoi et comment utiliser <code>Hoa\Console\Readline</code> ? Des exemples simples nous apprendrons à utiliser les raccourcis par défaut et nous aborderons même l''auto-complétion.</p>'
);

INSERT INTO awecode ( id, title, vimeoId, declare, description ) VALUES (
    'eventsource',
    '<code>Hoa\Eventsource</code>',
    72045658,
    '[{"id":"index","name":"Eventsource\/index.html","keyframes":[{"start":21,"end":29,"diff":"@@ -0,0 +1,3 @@\n+<pre id=\"output\"><\/pre>\n+<script>\n+<\/script>"},{"start":29,"end":50,"diff":"@@ -1,3 +1,14 @@\n <pre id=\"output\"><\/pre>\n <script>\n+var output = document.getElementById(''output'');\n+var source = new EventSource(''Server.php'');\n+\n+source.addEventListener(''tick'', function ( evt ) {\n+\n+    var samp       = document.createElement(''samp'');\n+    samp.innerHTML = evt.data + ''\\n'';\n+    output.appendChild(samp);\n+\n+    return;\n+});\n <\/script>"},{"start":153,"end":167,"diff":"@@ -1,14 +1,4 @@\n-<pre id=\"output\"><\/pre>\n-<script>\n-var output = document.getElementById(''output'');\n-var source = new EventSource(''Server.php'');\n+<link type=\"text\/css\" href=\"Style.css\" rel=\"stylesheet\" \/>\n \n-source.addEventListener(''tick'', function ( evt ) {\n-\n-    var samp       = document.createElement(''samp'');\n-    samp.innerHTML = evt.data + ''\\n'';\n-    output.appendChild(samp);\n-\n-    return;\n-});\n-<\/script>\n+<h1>Hello world<\/h1>\n+<div><p>I''m a paragraph.<\/p><\/div>"},{"start":167,"end":324,"diff":"@@ -2,3 +2,19 @@\n \n <h1>Hello world<\/h1>\n <div><p>I''m a paragraph.<\/p><\/div>\n+\n+<script>\n+var source = new EventSource(''Server.php'');\n+\n+source.addEventListener(''modify'', function ( e ) {\n+\n+    var tail = ''?__reload='' + (new Date().getTime());\n+    var sheets = document.querySelectorAll(''link[rel=\"stylesheet\"]'');\n+\n+    for(var i = 0, max = sheets.length; i < max; ++i) {\n+\n+        var sheet  = sheets.item(i);\n+        sheet.href = sheet.href.replace(\/\\?.*|$\/, tail);\n+    }\n+});\n+<\/script>"}]},{"id":"server","name":"Eventsource\/Server.php","keyframes":[{"start":50,"end":126,"diff":"@@ -0,0 +1,14 @@\n+<?php\n+\n+require ''\/usr\/local\/lib\/Hoa\/Core\/Core.php'';\n+\n+from(''Hoa'')\n+-> import(''Eventsource.Server'');\n+\n+$server = new Hoa\\Eventsource\\Server();\n+\n+while(true) {\n+\n+    $server->tick->send(time());\n+    sleep(1);\n+}"},{"start":126,"end":153,"diff":"@@ -3,12 +3,17 @@\n require ''\/usr\/local\/lib\/Hoa\/Core\/Core.php'';\n \n from(''Hoa'')\n+-> import(''File.Watcher'')\n -> import(''Eventsource.Server'');\n \n $server = new Hoa\\Eventsource\\Server();\n+$watcher = new Hoa\\File\\Watcher();\n \n-while(true) {\n+$watcher->in(''.'')\n+        ->name(''#\\.css$#'')\n+        ->on(''modify'', function ( $bucket ) use ( $server ) {\n \n-    $server->tick->send(time());\n-    sleep(1);\n-}\n+            $data = $bucket->getData();\n+            $server->modify->send($data[''file'']);\n+        })\n+        ->run();"}]}]',
    '<p>Au sommaire : pourquoi et comment utiliser <code>Hoa\Eventsource\Server</code> ? Un exemple simple et utile au quotidien nous illustrera la technologie EventSource (ou Server-Sent Events).</p>'
);
