'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e4e931f743275ce1107ecf1a29a0cf68",
"version.json": "f60311af9b9971714dc52030028af9ce",
"index.html": "b840860194b155150f02de95c1c76f16",
"/": "b840860194b155150f02de95c1c76f16",
"main.dart.js": "966a773782bd75fb8e9cb536ffaa6c04",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b761502641235994c77eeb31cdbb1dae",
"assets/AssetManifest.json": "6b68c99e57bed5d278916a097689e893",
"assets/NOTICES": "8175d30fa19110123767c2d67adc4c15",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "53bcacf0f7f470d8de9009ecb7cd4fc5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "feb68dad0ab717dc7fa296d85eb952be",
"assets/fonts/MaterialIcons-Regular.otf": "4f8a0a766554bdb258a5deb5524b2b92",
"assets/assets/images/collection/col1.png": "bf89d1bc22f549addbea0aa690df2a24",
"assets/assets/images/collection/col2.png": "fe8cc4835a0e3284adec510e8d7ded9c",
"assets/assets/images/collection/col3.png": "832998e526fe079a366184eec0201468",
"assets/assets/images/collection/col4.png": "4a1b11b31bf46b8e0952ff8f36fd6dc2",
"assets/assets/images/collection/col5.png": "c917ef53ecdcd7ddee8c80a4960b1607",
"assets/assets/images/banner_mobile.png": "f412a973e33e91db60827586f318e691",
"assets/assets/images/brands/prada.png": "d132ff4ea11933bd0c5e8c155068a55f",
"assets/assets/images/brands/chanel.png": "87a028255787dd48f1a03ca3f9a9e367",
"assets/assets/images/brands/hM.png": "4fb3bdc42d59f50d12ad1da42a00742b",
"assets/assets/images/brands/dolceGabbana%2520.png": "eae7b9944bad5d865c6c96625dc525a5",
"assets/assets/images/brands/zara.png": "1129d2319013c545acce83ff70bba5f8",
"assets/assets/images/brands/biba.png": "458915d854956826be8a2d2faba6cd22",
"assets/assets/images/Ratings.png": "64a3616a3acb4f8678dae67e740879e2",
"assets/assets/images/banner_web.png": "1ee5b99fd409ba3418ed366a57adaa3b",
"assets/assets/images/product/product2.png": "0aec082d8d0605ea3c031422bd178ecf",
"assets/assets/images/product/product3.png": "079277c66aa86f6e30acafe4c33b6105",
"assets/assets/images/product/product1.png": "74d753e890f5bf70e3efee76b43bd5df",
"assets/assets/images/product/product4.png": "b7128ebd50700d8dcba9e5e38de75e14",
"assets/assets/images/bag_bg.png": "e48cd2af4f531cbbf4ab1aa1b2cd612d",
"assets/assets/images/banner_black.png": "3bf86b16634394279eb10dd31a7c5aca",
"assets/assets/images/logo.png": "9a05c77fb5180c6b0673bcc270f2dc8b",
"assets/assets/images/banner_mobile1.png.png": "999da2c1102940c3b88afeb7614246a9",
"assets/assets/images/banner1_web.png": "b7ad15498ac314ca85a8df53afe31e99",
"assets/assets/images/empty_basket.png": "46847038734ec96223a4acf5d25b652d",
"assets/assets/images/grid/web/grid_web_large.png": "37960c9b185b19865187ee2ca0eec373",
"assets/assets/images/grid/web/grid_web_small2.png": "1ee87aeae8fc4a35c3c6077b565964e7",
"assets/assets/images/grid/web/grid_web_small1.png": "6df5eda9b0ab524c3e511cf11d3289de",
"assets/assets/images/grid/mobile/grid_mobile_small1.png": "91e4f45a320bd48f29cd4d68eb7e8bde",
"assets/assets/images/grid/mobile/grid_mobile_large.png": "a89ee2335a7d5498f8f0469c6c474fa0",
"assets/assets/images/grid/mobile/grid_mobile_small.png": "977177573f5a84ce19f7378400132d8f",
"assets/assets/icons/wishlist.png": "d36b73d41523d2a2eafcddf2d2fd287a",
"assets/assets/icons/watches.png": "a9d88f0ffc4d29ee5966153a0dda1f3c",
"assets/assets/icons/add.png": "32f2f6da85e418b04b739d0031b7bca0",
"assets/assets/icons/wishlist_true.png": "616767bca843f08a6ecd7ed8310f19d8",
"assets/assets/icons/plus.png": "bfaf5e8aa3d53f6602193a6efc7a8358",
"assets/assets/icons/skincare.png": "4a617091fab86a5a8512975856e82ca1",
"assets/assets/icons/fb.png": "ba2aa530decfa0a5516de79a7ae3e81a",
"assets/assets/icons/fullscreen.png": "c15a960dd31eb81cee4e3c11ff4c89f6",
"assets/assets/icons/jewellery.png": "ca9fbdd699d09b6327a6ba612a0ab9ac",
"assets/assets/icons/search.png": "acc0d5493c45cbd16a933f4cf5ddd20a",
"assets/assets/icons/minus.png": "342bd98f4dd7c90307ae0289d2fefab2",
"assets/assets/icons/bags.png": "9e036888eb165bdf727479aa57d832f6",
"assets/assets/icons/menu.png": "f15e787e977264e8ab0ff1f91059aff8",
"assets/assets/icons/filter.png": "aa28884b596117f88ae31955a075c694",
"assets/assets/icons/twitter.png": "cac541069ce6d6a36e88fa55c21136ad",
"assets/assets/icons/insta.png": "4ebedab2fd404744d086253d795f5a1a",
"assets/assets/icons/sort.png": "5446adc63beb5cbb56ddff24da039c03",
"assets/assets/icons/profile.png": "3e14eb0086946a29638ca34784f2e038",
"assets/assets/icons/location.png": "b97f3f5ec1afeb3c86fe673a54e2303e",
"assets/assets/icons/youtube.png": "700523afc573f3dc3e282aaed8f0d5b7",
"assets/assets/icons/notification.png": "6be548ad3b8f7db5884876b8c2ba1997",
"assets/assets/icons/bag.png": "7b182f26582e97af58601c14f3307391",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
  for (var resourceKey of Object.keys(RESOURCES)) {
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
