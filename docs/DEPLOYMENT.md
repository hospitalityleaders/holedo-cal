# Holedo Calendar deployment and conformance gate

Native deployment instructions remain in [README-Docker.md](../README-Docker.md) and [README.md](../README.md); admin provisioning remains in [ADMIN.md](ADMIN.md). This adds the Holedo release gate rather than replacing those recipes.

## Before a proposed production release

- Read [HOLEDO_STANDARD.md](HOLEDO_STANDARD.md), pin the published 1.0 SHA and resolve [baseline gaps](HOLEDO_CONFORMANCE.md).
- Complete canonical `admin/CONFORMANCE.md` in an isolated environment. Record application SHA, visual and behavioral/security evidence; a contract alone does not satisfy the gate.
- Verify shell, vocabulary/order, widths/spacing, Source Sans Pro, tokens, 2px radius and Light/Dark/Automatic. Preserve native operations and booking themes.
- Verify icon/meta/OG/homepage/access changes, database persistence/reset, consent and injection exclusion from every admin route/preview.
- Resolve admin-model migration or approved exception. Current role/live checks remain active. If implemented, `ADMIN_TOKEN` and `ADMIN_SESSION_SECRET` are independent per-product secrets and never replace `SECRET_KEY_BASE`. Test sessions, rotation, CSRF and sign-out in isolation. Never put secret values in evidence.
- Run relevant Calendar checks and meaningful tests for new behavior; record Verify workflow results rather than assuming a pass.
- Confirm actual hostname, TLS/proxy, Keycloak/OIDC redirects and approved policy scope. Earlier `toledo.com`/Holedo wording is not DNS authorization.
- Prepare reviewed migrations, backups, recovery and rollback for the eventual implementation, including validated native admin recovery.

## Approval boundary

Production deployment, release-publication workflow dispatch, `v*` release tags, live migrations, DNS/Cloudflare/proxy, production secrets and identity-provider changes require explicit approval. This documentation patch performs none of these.

`docker-publish.yml` accepts `v*` tags/manual dispatch; other release/provider workflows have their own triggers. Inspect triggers before future publication. Never version these docs using a Calendar release tag or dispatch publishing workflows merely to validate conformance.
