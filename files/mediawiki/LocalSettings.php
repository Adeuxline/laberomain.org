
# NAMESPACE
// Define constants for my additional namespaces.
define("NS_RECETTE", 3000); // This MUST be even.
define("NS_RECETTE_TALK", 3001); // This MUST be the following odd integer.
// Add namespaces.
$wgExtraNamespaces[NS_RECETTE] = "Recette";
$wgExtraNamespaces[NS_RECETTE_TALK] = "Recette_talk"; // Note underscores in the namespace name.
# BOOTSTRAP
$wgHooks['SetupAfterCache'][]=function(){
        \Bootstrap\BootstrapManager::getInstance()->addAllBootstrapModules();
        return true;
};
$wgHooks['ParserAfterParse'][]=function( Parser &$parser, &$text, StripState &$stripState ){
        $parser->getOutput()->addModuleStyles( 'ext.bootstrap.styles' );
        $parser->getOutput()->addModuleScripts( 'ext.bootstrap.scripts' );
        return true;
};
# SMW
enableSemantics( 'dev.dofus-wiki.org' );
wfLoadExtension( 'SemanticResultFormats' );

#######################################
#     EDITORS
#######################################
wfLoadExtension( 'CodeEditor' );
$wgDefaultUserOptions['usebetatoolbar'] = 1;
wfLoadExtension( 'CodeMirror' );
$wgDefaultUserOptions['usecodemirror'] = 1;
wfLoadExtension( 'WikiEditor' );
$wgHiddenPrefs[] = 'usebetatoolbar';
wfLoadExtension( 'InputBox' );
wfLoadExtension( 'ParserFunctions' );
$wgPFEnableStringFunctions = true;
wfLoadExtension( 'Scribunto' );
$wgScribuntoDefaultEngine = 'luastandalone';
$wgScribuntoUseCodeEditor = true;
$wgScribuntoUseGeSHi = true;
wfLoadExtension( 'SyntaxHighlight_GeSHi' );
wfLoadExtension( 'HeaderTabs' );
wfLoadExtension( 'AntiSpoof' );

wfLoadExtension( 'SpamBlacklist' );
$wgBlacklistSettings = [
        'spam' => [
                'files' => [
                        "https://meta.wikimedia.org/w/index.php?title=Spam_blacklist&action=raw&sb_ver=1",
                        "https://en.wikipedia.org/w/index.php?title=MediaWiki:Spam-blacklist&action=raw&sb_ver=1"
                ],
        ],
];
wfLoadExtension( 'TitleBlacklist' );
$wgTitleBlacklistSources = array(
    array(
         'type' => 'url',
         'src'  => 'https://meta.wikimedia.org/w/index.php?title=Title_blacklist&action=raw',
    ),
);
wfLoadExtension( 'TorBlock' );

wfLoadExtension( 'Variables' );
require_once "$IP/extensions/Loops/Loops.php";
