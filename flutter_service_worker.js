'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/audio/success.mp3": "418e547dba938d99e100786ade6400f1",
"assets/assets/audio/mmm-3.wav": "8507861bd8e7f8d6d01a3c552d71acb6",
"assets/assets/audio/backgorundMusic.mp3": "045856e7801067738dad3eb2e629fc26",
"assets/assets/audio/mmm-2.wav": "ac59e9d300f6b19e06cb94a30761f401",
"assets/assets/audio/mmm-1.wav": "4367ccb1dad5d490124d69ab377db71d",
"assets/assets/svg/animals/animals.svg": "e80a709de071e9c5644a0e814471edd7",
"assets/assets/svg/animals/Lion.svg": "b203cbe7e9895a404b4ad9854b7ec70c",
"assets/assets/svg/animals/Elephant.svg": "172548a29c2d83f875c9a2d740dbb567",
"assets/assets/svg/animals/Piggish.svg": "adaa328e8d91f115b7a9a58ffc4fee9a",
"assets/assets/svg/animals/BrownSnake.svg": "8caa8ce91b451f9b3080fb754e818397",
"assets/assets/svg/animals/Butterfly.svg": "22c57437506029ed02df2095c3b6ca48",
"assets/assets/svg/animals/Mouse.svg": "ace938829aad3350ed2192087a97d18c",
"assets/assets/svg/animals/Kangaroo.svg": "9585ca25bbff0932eff471b695c1df6d",
"assets/assets/svg/animals/Pelican.svg": "4a9bba750ec14d414061e1563da096c6",
"assets/assets/svg/animals/Panda.svg": "f19c4029d1648e243087aa71453445aa",
"assets/assets/svg/animals/Rhinoceros.svg": "11bf4a4b4641374a34ebb5acb3f5306e",
"assets/assets/svg/animals/Dog.svg": "f9019d67ee3271a1188b845a9837ebc8",
"assets/assets/svg/animals/Papegoja.svg": "55bc26854835315b85077e89202f8c82",
"assets/assets/svg/animals/Rabbit.svg": "7924fe9a152a153410fd7896be9ef6a9",
"assets/assets/svg/animals/GreenSnake.svg": "ebe695abccd5e50a007875c7729448f8",
"assets/assets/svg/animals/RedSnake.svg": "8afbbc60751c062006c8722deb592043",
"assets/assets/svg/animals/Bear.svg": "7228895426a173eb5e114c96e8b24a56",
"assets/assets/svg/animals/Camel.svg": "eca70bbbcbdcbcf3a46c392311e4c785",
"assets/assets/svg/animals/Cat.svg": "c9b21438e0a4f74641be000f44eb3ce8",
"assets/assets/images/LandscapeBackground.jpg": "7e4e576def5fde89d30bce5732b348ef",
"assets/assets/images/StartScreenBackground.jpeg": "4e8e6d2d674eed1caa5a1b0c32188fe6",
"assets/assets/animations/Robbo.flr": "585322ca43c65f81c955c6a88d7718fa",
"assets/AssetManifest.json": "3d8336070cac048c02a5b487314936c3",
"assets/fonts/MaterialIcons-Regular.otf": "132a5e63b5e510933ab4845577716106",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "743b022d92fedc060058ac141794dc28",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "ee66ab2512e67c80c79ada32ff4c6764",
"main.dart.js": "3d047e4fe6b344d31a1ae6f82c0ad1a9",
"manifest.json": "4b755174eea71f15589a07c64c8a33a6",
"index.html": "ffa43f70eb25521b0400e3cf2395a4b5",
"/": "ffa43f70eb25521b0400e3cf2395a4b5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
