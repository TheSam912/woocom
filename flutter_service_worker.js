'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "68fb6b5ddd6adbb5bf62a186f7b3e4a9",
"version.json": "f60311af9b9971714dc52030028af9ce",
"index.html": "b840860194b155150f02de95c1c76f16",
"/": "b840860194b155150f02de95c1c76f16",
"main.dart.js": "0147564a6ae9e1afbf2acf651a78a861",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b761502641235994c77eeb31cdbb1dae",
"assets/AssetManifest.json": "3dcd8db665eaffda6a056c28cfdf57e1",
"assets/NOTICES": "5d2f6841ba148e3f22326a8a9ecf012a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "542398c61d9266247797589b93ba1b2d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4bd2988d7796c0d07246a274c5c9efc5",
"assets/fonts/MaterialIcons-Regular.otf": "aa6e0c10cbb27887d601776204875076",
"assets/assets/images/btnEdit.png": "d2f88f9892d01822368f43f0edae8381",
"assets/assets/images/collection/col1.png": "bf89d1bc22f549addbea0aa690df2a24",
"assets/assets/images/collection/col2.png": "fe8cc4835a0e3284adec510e8d7ded9c",
"assets/assets/images/collection/col3.png": "832998e526fe079a366184eec0201468",
"assets/assets/images/collection/col4.png": "4a1b11b31bf46b8e0952ff8f36fd6dc2",
"assets/assets/images/collection/col5.png": "c917ef53ecdcd7ddee8c80a4960b1607",
"assets/assets/images/singin_image.png": "d23b5639e547d3d22f4ee39e03d31ed5",
"assets/assets/images/banner_mobile.png": "f412a973e33e91db60827586f318e691",
"assets/assets/images/brands/prada.png": "d132ff4ea11933bd0c5e8c155068a55f",
"assets/assets/images/brands/chanel.png": "87a028255787dd48f1a03ca3f9a9e367",
"assets/assets/images/brands/hM.png": "4fb3bdc42d59f50d12ad1da42a00742b",
"assets/assets/images/brands/dolceGabbana%2520.png": "eae7b9944bad5d865c6c96625dc525a5",
"assets/assets/images/brands/zara.png": "1129d2319013c545acce83ff70bba5f8",
"assets/assets/images/brands/biba.png": "458915d854956826be8a2d2faba6cd22",
"assets/assets/images/btnDelete.png": "cee1ef75c1e48c5d2646eb6101adcd50",
"assets/assets/images/Ratings.png": "64a3616a3acb4f8678dae67e740879e2",
"assets/assets/images/orderschart.png": "77a8f156f6c5bfdfb19bc493e349b40b",
"assets/assets/images/banner_web.png": "1ee5b99fd409ba3418ed366a57adaa3b",
"assets/assets/images/boxes.png": "fcb83a3939b26fdc097c52022843fca9",
"assets/assets/images/last7days.png": "72865b4bae47d468c48ad81ce1648fb2",
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
"assets/assets/icons/brands.png": "b339d186d969c26d631174cef3e83b13",
"assets/assets/icons/dashboard.png": "5952dac61f790490a411b380fbba5506",
"assets/assets/icons/mail.png": "0734169f2c42cad90251001a6f27a7dd",
"assets/assets/icons/skincare.png": "4a617091fab86a5a8512975856e82ca1",
"assets/assets/icons/fb.png": "ba2aa530decfa0a5516de79a7ae3e81a",
"assets/assets/icons/fullscreen.png": "c15a960dd31eb81cee4e3c11ff4c89f6",
"assets/assets/icons/jewellery.png": "ca9fbdd699d09b6327a6ba612a0ab9ac",
"assets/assets/icons/search.png": "acc0d5493c45cbd16a933f4cf5ddd20a",
"assets/assets/icons/minus.png": "342bd98f4dd7c90307ae0289d2fefab2",
"assets/assets/icons/bags.png": "9e036888eb165bdf727479aa57d832f6",
"assets/assets/icons/menu.png": "f15e787e977264e8ab0ff1f91059aff8",
"assets/assets/icons/password.png": "0af59bc3b2bd1760073a386b723daffa",
"assets/assets/icons/filter.png": "aa28884b596117f88ae31955a075c694",
"assets/assets/icons/twitter.png": "cac541069ce6d6a36e88fa55c21136ad",
"assets/assets/icons/insta.png": "4ebedab2fd404744d086253d795f5a1a",
"assets/assets/icons/sort.png": "5446adc63beb5cbb56ddff24da039c03",
"assets/assets/icons/profile.png": "3e14eb0086946a29638ca34784f2e038",
"assets/assets/icons/location.png": "b97f3f5ec1afeb3c86fe673a54e2303e",
"assets/assets/icons/products.png": "39dcc1c89c99e7b58271c0f8a42e6e99",
"assets/assets/icons/youtube.png": "700523afc573f3dc3e282aaed8f0d5b7",
"assets/assets/icons/open.png": "5275b70f79eef841c958dc7a46ae0e69",
"assets/assets/icons/customers.png": "df5cc029d91b4cf4a641527d44dc8fd6",
"assets/assets/icons/categories.png": "47c2418938018c63842bf3e5577697c5",
"assets/assets/icons/notification.png": "6be548ad3b8f7db5884876b8c2ba1997",
"assets/assets/icons/bag.png": "7b182f26582e97af58601c14f3307391",
"assets/assets/icons/personal.png": "017172ef627f9ff57145acaaf8049fda",
"assets/assets/icons/orders.png": "4444403ce10860e9d05cb22ca921f557",
"assets/assets/assets/images/onboarding/effect.png": "a68621a6b413d99c5a31f210c002936e",
"assets/assets/assets/images/onboarding/onboarding.png": "2f569e96007515b5044912a9cc5fe787",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
