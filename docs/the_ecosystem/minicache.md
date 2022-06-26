# minicli/minicache

**Repository:** [https://github.com/minicli/minicache](https://github.com/minicli/minicache)

A small-footprint, file-based JSON cache that can be used standalone or within Minicli apps.

Requires `php-json`.

```php
<?php
use Minicli\Minicache\FileCache;
...

$cache = new FileCache($cache_file_path, $cache_expiry_in_seconds);
$cache_id = "unique-content-identifier";

//saving cache
$cache->save(json_encode($mydata), $cache_id);

//obtaining cached content that is not expired yet
$cached_content = $cache->getCachedUnlessExpired($cache_id);

```