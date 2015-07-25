<?xml version="1.0"?>
<transform
    version="1.0"
    xmlns="http://www.w3.org/1999/XSL/Transform"
>

    <output
        method="text"
    />

    <template match="video">
        <text>.thumbnails/</text><value-of select="@href" />.jpg: <value-of select="@href" /><text>&#xa;</text>
        <text>thumbnails: .thumbnails/</text><value-of select="@href" /><text>.jpg&#xa;</text>
    </template>

    <template match="@*|node()">
        <apply-templates />
    </template>

</transform>
