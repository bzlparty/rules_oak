<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Public API re-exports

<a id="oak"></a>

## oak

<pre>
oak(<a href="#oak-name">name</a>, <a href="#oak-args">args</a>, <a href="#oak-data">data</a>, <a href="#oak-deps">deps</a>, <a href="#oak-outputs">outputs</a>, <a href="#oak-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="oak-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="oak-args"></a>args |  -   | List of strings | optional | <code>[]</code> |
| <a id="oak-data"></a>data |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak-deps"></a>deps |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak-outputs"></a>outputs |  -   | List of labels | required |  |
| <a id="oak-srcs"></a>srcs |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


<a id="oak_bundle"></a>

## oak_bundle

<pre>
oak_bundle(<a href="#oak_bundle-name">name</a>, <a href="#oak_bundle-data">data</a>, <a href="#oak_bundle-deps">deps</a>, <a href="#oak_bundle-entry_point">entry_point</a>, <a href="#oak_bundle-out">out</a>, <a href="#oak_bundle-srcs">srcs</a>, <a href="#oak_bundle-web">web</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="oak_bundle-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="oak_bundle-data"></a>data |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak_bundle-deps"></a>deps |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak_bundle-entry_point"></a>entry_point |  -   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |
| <a id="oak_bundle-out"></a>out |  -   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  |
| <a id="oak_bundle-srcs"></a>srcs |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="oak_bundle-web"></a>web |  -   | Boolean | optional | <code>False</code> |


<a id="oak_library"></a>

## oak_library

<pre>
oak_library(<a href="#oak_library-name">name</a>, <a href="#oak_library-data">data</a>, <a href="#oak_library-deps">deps</a>, <a href="#oak_library-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="oak_library-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="oak_library-data"></a>data |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak_library-deps"></a>deps |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="oak_library-srcs"></a>srcs |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


<a id="oak_binary"></a>

## oak_binary

<pre>
oak_binary(<a href="#oak_binary-name">name</a>, <a href="#oak_binary-srcs">srcs</a>, <a href="#oak_binary-entry">entry</a>, <a href="#oak_binary-kwargs">kwargs</a>)
</pre>



**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="oak_binary-name"></a>name |  <p align="center"> - </p>   |  none |
| <a id="oak_binary-srcs"></a>srcs |  <p align="center"> - </p>   |  none |
| <a id="oak_binary-entry"></a>entry |  <p align="center"> - </p>   |  <code>None</code> |
| <a id="oak_binary-kwargs"></a>kwargs |  <p align="center"> - </p>   |  none |


